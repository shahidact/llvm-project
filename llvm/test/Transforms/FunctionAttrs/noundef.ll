; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 4
; RUN: opt < %s -passes='function-attrs' -S | FileCheck %s

@g_var = external global [0 x i8]

define i32 @test_ret_constant() {
; CHECK-LABEL: define noundef i32 @test_ret_constant(
; CHECK-SAME: ) #[[ATTR0:[0-9]+]] {
; CHECK-NEXT:    ret i32 0
;
  ret i32 0
}

define i32 @test_ret_poison() {
; CHECK-LABEL: define i32 @test_ret_poison(
; CHECK-SAME: ) #[[ATTR0]] {
; CHECK-NEXT:    ret i32 poison
;
  ret i32 poison
}

define i32 @test_ret_undef() {
; CHECK-LABEL: define i32 @test_ret_undef(
; CHECK-SAME: ) #[[ATTR0]] {
; CHECK-NEXT:    ret i32 undef
;
  ret i32 undef
}

define i32 @test_ret_param(i32 %x) {
; CHECK-LABEL: define i32 @test_ret_param(
; CHECK-SAME: i32 returned [[X:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    ret i32 [[X]]
;
  ret i32 %x
}

define i32 @test_ret_noundef_param(i32 noundef %x) {
; CHECK-LABEL: define noundef i32 @test_ret_noundef_param(
; CHECK-SAME: i32 noundef returned [[X:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    ret i32 [[X]]
;
  ret i32 %x
}

define i32 @test_ret_noundef_expr(i32 noundef %x) {
; CHECK-LABEL: define noundef i32 @test_ret_noundef_expr(
; CHECK-SAME: i32 noundef [[X:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[Y:%.*]] = add i32 [[X]], 1
; CHECK-NEXT:    ret i32 [[Y]]
;
  %y = add i32 %x, 1
  ret i32 %y
}

define i32 @test_ret_create_poison_expr(i32 noundef %x) {
; CHECK-LABEL: define i32 @test_ret_create_poison_expr(
; CHECK-SAME: i32 noundef [[X:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[Y:%.*]] = add nsw i32 [[X]], 1
; CHECK-NEXT:    ret i32 [[Y]]
;
  %y = add nsw i32 %x, 1
  ret i32 %y
}

define i32 @test_ret_freezed(i32 noundef %x) {
; CHECK-LABEL: define noundef i32 @test_ret_freezed(
; CHECK-SAME: i32 noundef [[X:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[Y:%.*]] = add nsw i32 [[X]], 1
; CHECK-NEXT:    [[Z:%.*]] = freeze i32 [[Y]]
; CHECK-NEXT:    ret i32 [[Z]]
;
  %y = add nsw i32 %x, 1
  %z = freeze i32 %y
  ret i32 %z
}

define i32 @test_ret_control_flow(i32 noundef %x) {
; CHECK-LABEL: define noundef i32 @test_ret_control_flow(
; CHECK-SAME: i32 noundef [[X:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[COND:%.*]] = icmp eq i32 [[X]], 0
; CHECK-NEXT:    br i1 [[COND]], label [[IF_THEN:%.*]], label [[IF_ELSE:%.*]]
; CHECK:       if.then:
; CHECK-NEXT:    ret i32 2
; CHECK:       if.else:
; CHECK-NEXT:    [[RET:%.*]] = add i32 [[X]], 1
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cond = icmp eq i32 %x, 0
  br i1 %cond, label %if.then, label %if.else
if.then:
  ret i32 2
if.else:
  %ret = add i32 %x, 1
  ret i32 %ret
}

define i32 @test_ret_control_flow_may_poison(i32 noundef %x) {
; CHECK-LABEL: define i32 @test_ret_control_flow_may_poison(
; CHECK-SAME: i32 noundef [[X:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[COND:%.*]] = icmp eq i32 [[X]], 0
; CHECK-NEXT:    br i1 [[COND]], label [[IF_THEN:%.*]], label [[IF_ELSE:%.*]]
; CHECK:       if.then:
; CHECK-NEXT:    ret i32 2
; CHECK:       if.else:
; CHECK-NEXT:    [[RET:%.*]] = add nsw i32 [[X]], 1
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cond = icmp eq i32 %x, 0
  br i1 %cond, label %if.then, label %if.else
if.then:
  ret i32 2
if.else:
  %ret = add nsw i32 %x, 1
  ret i32 %ret
}

; TODO: use context-sensitive analysis
define i32 @test_ret_control_flow_never_poison(i32 noundef %x) {
; CHECK-LABEL: define i32 @test_ret_control_flow_never_poison(
; CHECK-SAME: i32 noundef [[X:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[COND:%.*]] = icmp eq i32 [[X]], 2147483647
; CHECK-NEXT:    br i1 [[COND]], label [[IF_THEN:%.*]], label [[IF_ELSE:%.*]]
; CHECK:       if.then:
; CHECK-NEXT:    ret i32 2
; CHECK:       if.else:
; CHECK-NEXT:    [[RET:%.*]] = add nsw i32 [[X]], 1
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cond = icmp eq i32 %x, 2147483647
  br i1 %cond, label %if.then, label %if.else
if.then:
  ret i32 2
if.else:
  %ret = add nsw i32 %x, 1
  ret i32 %ret
}

define i32 @test_noundef_prop() {
; CHECK-LABEL: define noundef i32 @test_noundef_prop(
; CHECK-SAME: ) #[[ATTR0]] {
; CHECK-NEXT:    [[RET:%.*]] = call i32 @test_ret_constant()
; CHECK-NEXT:    ret i32 [[RET]]
;
  %ret = call i32 @test_ret_constant()
  ret i32 %ret
}

; Don't deduce noundef for functions with sanitize_memory.
define i32 @test_ret_constant_msan() sanitize_memory {
; CHECK-LABEL: define i32 @test_ret_constant_msan(
; CHECK-SAME: ) #[[ATTR1:[0-9]+]] {
; CHECK-NEXT:    ret i32 0
;
  ret i32 0
}

define i64 @test_trunc_with_constexpr() {
; CHECK-LABEL: define noundef i64 @test_trunc_with_constexpr(
; CHECK-SAME: ) #[[ATTR0]] {
; CHECK-NEXT:    [[ADD:%.*]] = add i32 trunc (i64 sub (i64 0, i64 ptrtoint (ptr @g_var to i64)) to i32), 1
; CHECK-NEXT:    [[CONV:%.*]] = sext i32 [[ADD]] to i64
; CHECK-NEXT:    ret i64 [[CONV]]
;
  %add = add i32 trunc (i64 sub (i64 0, i64 ptrtoint (ptr @g_var to i64)) to i32), 1
  %conv = sext i32 %add to i64
  ret i64 %conv
}

define align 4 ptr @maybe_not_aligned(ptr noundef %p) {
; CHECK-LABEL: define align 4 ptr @maybe_not_aligned(
; CHECK-SAME: ptr noundef readnone returned captures(ret: address, provenance) [[P:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    ret ptr [[P]]
;
  ret ptr %p
}

define align 4 ptr @definitely_aligned(ptr noundef align 4 %p) {
; CHECK-LABEL: define noundef align 4 ptr @definitely_aligned(
; CHECK-SAME: ptr noundef readnone returned align 4 captures(ret: address, provenance) [[P:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    ret ptr [[P]]
;
  ret ptr %p
}

define nonnull ptr @maybe_not_nonnull(ptr noundef %p) {
; CHECK-LABEL: define nonnull ptr @maybe_not_nonnull(
; CHECK-SAME: ptr noundef readnone returned captures(ret: address, provenance) [[P:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    ret ptr [[P]]
;
  ret ptr %p
}

define nonnull ptr @definitely_nonnull(ptr noundef nonnull %p) {
; CHECK-LABEL: define noundef nonnull ptr @definitely_nonnull(
; CHECK-SAME: ptr noundef nonnull readnone returned captures(ret: address, provenance) [[P:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    ret ptr [[P]]
;
  ret ptr %p
}

define range(i8 0, 10) i8 @maybe_not_in_range(i8 noundef %v) {
; CHECK-LABEL: define range(i8 0, 10) i8 @maybe_not_in_range(
; CHECK-SAME: i8 noundef returned [[V:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    ret i8 [[V]]
;
  ret i8 %v
}

define range(i8 0, 10) i8 @definitely_in_range(i8 noundef range(i8 0, 10) %v) {
; CHECK-LABEL: define noundef range(i8 0, 10) i8 @definitely_in_range(
; CHECK-SAME: i8 noundef returned range(i8 0, 10) [[V:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    ret i8 [[V]]
;
  ret i8 %v
}
