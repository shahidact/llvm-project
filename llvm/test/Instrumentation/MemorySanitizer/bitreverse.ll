; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 4
; RUN: opt < %s -passes=msan -S | FileCheck %s
;
; Forked from llvm/test/CodeGen/X86/bitreverse.ll

target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

declare <2 x i16> @llvm.bitreverse.v2i16(<2 x i16>) readnone

define <2 x i16> @test_bitreverse_v2i16(<2 x i16> %a) nounwind #0 {
; CHECK-LABEL: define <2 x i16> @test_bitreverse_v2i16(
; CHECK-SAME: <2 x i16> [[A:%.*]]) #[[ATTR1:[0-9]+]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <2 x i16>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP2:%.*]] = call <2 x i16> @llvm.bitreverse.v2i16(<2 x i16> [[TMP1]])
; CHECK-NEXT:    [[B:%.*]] = call <2 x i16> @llvm.bitreverse.v2i16(<2 x i16> [[A]])
; CHECK-NEXT:    store <2 x i16> [[TMP2]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <2 x i16> [[B]]
;
  %b = call <2 x i16> @llvm.bitreverse.v2i16(<2 x i16> %a)
  ret <2 x i16> %b
}

declare i64 @llvm.bitreverse.i64(i64) readnone

define i64 @test_bitreverse_i64(i64 %a) nounwind #0 {
; CHECK-LABEL: define i64 @test_bitreverse_i64(
; CHECK-SAME: i64 [[A:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load i64, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP2:%.*]] = call i64 @llvm.bitreverse.i64(i64 [[TMP1]])
; CHECK-NEXT:    [[B:%.*]] = call i64 @llvm.bitreverse.i64(i64 [[A]])
; CHECK-NEXT:    store i64 [[TMP2]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret i64 [[B]]
;
  %b = call i64 @llvm.bitreverse.i64(i64 %a)
  ret i64 %b
}

declare i32 @llvm.bitreverse.i32(i32) readnone

define i32 @test_bitreverse_i32(i32 %a) nounwind #0 {
; CHECK-LABEL: define i32 @test_bitreverse_i32(
; CHECK-SAME: i32 [[A:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load i32, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP2:%.*]] = call i32 @llvm.bitreverse.i32(i32 [[TMP1]])
; CHECK-NEXT:    [[B:%.*]] = call i32 @llvm.bitreverse.i32(i32 [[A]])
; CHECK-NEXT:    store i32 [[TMP2]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret i32 [[B]]
;
  %b = call i32 @llvm.bitreverse.i32(i32 %a)
  ret i32 %b
}

declare i24 @llvm.bitreverse.i24(i24) readnone

define i24 @test_bitreverse_i24(i24 %a) nounwind #0 {
; CHECK-LABEL: define i24 @test_bitreverse_i24(
; CHECK-SAME: i24 [[A:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load i24, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP2:%.*]] = call i24 @llvm.bitreverse.i24(i24 [[TMP1]])
; CHECK-NEXT:    [[B:%.*]] = call i24 @llvm.bitreverse.i24(i24 [[A]])
; CHECK-NEXT:    store i24 [[TMP2]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret i24 [[B]]
;
  %b = call i24 @llvm.bitreverse.i24(i24 %a)
  ret i24 %b
}

declare i16 @llvm.bitreverse.i16(i16) readnone

define i16 @test_bitreverse_i16(i16 %a) nounwind #0 {
; CHECK-LABEL: define i16 @test_bitreverse_i16(
; CHECK-SAME: i16 [[A:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load i16, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP2:%.*]] = call i16 @llvm.bitreverse.i16(i16 [[TMP1]])
; CHECK-NEXT:    [[B:%.*]] = call i16 @llvm.bitreverse.i16(i16 [[A]])
; CHECK-NEXT:    store i16 [[TMP2]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret i16 [[B]]
;
  %b = call i16 @llvm.bitreverse.i16(i16 %a)
  ret i16 %b
}

declare i8 @llvm.bitreverse.i8(i8) readnone

define i8 @test_bitreverse_i8(i8 %a) #0 {
; CHECK-LABEL: define i8 @test_bitreverse_i8(
; CHECK-SAME: i8 [[A:%.*]]) #[[ATTR2:[0-9]+]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load i8, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP2:%.*]] = call i8 @llvm.bitreverse.i8(i8 [[TMP1]])
; CHECK-NEXT:    [[B:%.*]] = call i8 @llvm.bitreverse.i8(i8 [[A]])
; CHECK-NEXT:    store i8 [[TMP2]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret i8 [[B]]
;
  %b = call i8 @llvm.bitreverse.i8(i8 %a)
  ret i8 %b
}

declare i4 @llvm.bitreverse.i4(i4) readnone

define i4 @test_bitreverse_i4(i4 %a) #0 {
; CHECK-LABEL: define i4 @test_bitreverse_i4(
; CHECK-SAME: i4 [[A:%.*]]) #[[ATTR2]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load i4, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP2:%.*]] = call i4 @llvm.bitreverse.i4(i4 [[TMP1]])
; CHECK-NEXT:    [[B:%.*]] = call i4 @llvm.bitreverse.i4(i4 [[A]])
; CHECK-NEXT:    store i4 [[TMP2]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret i4 [[B]]
;
  %b = call i4 @llvm.bitreverse.i4(i4 %a)
  ret i4 %b
}

; These tests check that bitreverse(constant) calls are folded

define <2 x i16> @fold_v2i16() #0 {
; CHECK-LABEL: define <2 x i16> @fold_v2i16(
; CHECK-SAME: ) #[[ATTR2]] {
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP1:%.*]] = call <2 x i16> @llvm.bitreverse.v2i16(<2 x i16> zeroinitializer)
; CHECK-NEXT:    [[B:%.*]] = call <2 x i16> @llvm.bitreverse.v2i16(<2 x i16> <i16 15, i16 3840>)
; CHECK-NEXT:    store <2 x i16> [[TMP1]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <2 x i16> [[B]]
;
  %b = call <2 x i16> @llvm.bitreverse.v2i16(<2 x i16> <i16 15, i16 3840>)
  ret <2 x i16> %b
}

define i24 @fold_i24() #0 {
; CHECK-LABEL: define i24 @fold_i24(
; CHECK-SAME: ) #[[ATTR2]] {
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP1:%.*]] = call i24 @llvm.bitreverse.i24(i24 0)
; CHECK-NEXT:    [[B:%.*]] = call i24 @llvm.bitreverse.i24(i24 4096)
; CHECK-NEXT:    store i24 [[TMP1]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret i24 [[B]]
;
  %b = call i24 @llvm.bitreverse.i24(i24 4096)
  ret i24 %b
}

define i8 @fold_i8() #0 {
; CHECK-LABEL: define i8 @fold_i8(
; CHECK-SAME: ) #[[ATTR2]] {
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP1:%.*]] = call i8 @llvm.bitreverse.i8(i8 0)
; CHECK-NEXT:    [[B:%.*]] = call i8 @llvm.bitreverse.i8(i8 15)
; CHECK-NEXT:    store i8 [[TMP1]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret i8 [[B]]
;
  %b = call i8 @llvm.bitreverse.i8(i8 15)
  ret i8 %b
}

define i4 @fold_i4() #0 {
; CHECK-LABEL: define i4 @fold_i4(
; CHECK-SAME: ) #[[ATTR2]] {
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP1:%.*]] = call i4 @llvm.bitreverse.i4(i4 0)
; CHECK-NEXT:    [[B:%.*]] = call i4 @llvm.bitreverse.i4(i4 -8)
; CHECK-NEXT:    store i4 [[TMP1]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret i4 [[B]]
;
  %b = call i4 @llvm.bitreverse.i4(i4 8)
  ret i4 %b
}

; These tests check that bitreverse(bitreverse()) calls are removed

define i8 @identity_i8(i8 %a) #0 {
; CHECK-LABEL: define i8 @identity_i8(
; CHECK-SAME: i8 [[A:%.*]]) #[[ATTR2]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load i8, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP2:%.*]] = call i8 @llvm.bitreverse.i8(i8 [[TMP1]])
; CHECK-NEXT:    [[B:%.*]] = call i8 @llvm.bitreverse.i8(i8 [[A]])
; CHECK-NEXT:    [[TMP3:%.*]] = call i8 @llvm.bitreverse.i8(i8 [[TMP2]])
; CHECK-NEXT:    [[C:%.*]] = call i8 @llvm.bitreverse.i8(i8 [[B]])
; CHECK-NEXT:    store i8 [[TMP3]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret i8 [[C]]
;
  %b = call i8 @llvm.bitreverse.i8(i8 %a)
  %c = call i8 @llvm.bitreverse.i8(i8 %b)
  ret i8 %c
}

define <2 x i16> @identity_v2i16(<2 x i16> %a) #0 {
; CHECK-LABEL: define <2 x i16> @identity_v2i16(
; CHECK-SAME: <2 x i16> [[A:%.*]]) #[[ATTR2]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <2 x i16>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP2:%.*]] = call <2 x i16> @llvm.bitreverse.v2i16(<2 x i16> [[TMP1]])
; CHECK-NEXT:    [[B:%.*]] = call <2 x i16> @llvm.bitreverse.v2i16(<2 x i16> [[A]])
; CHECK-NEXT:    [[TMP3:%.*]] = call <2 x i16> @llvm.bitreverse.v2i16(<2 x i16> [[TMP2]])
; CHECK-NEXT:    [[C:%.*]] = call <2 x i16> @llvm.bitreverse.v2i16(<2 x i16> [[B]])
; CHECK-NEXT:    store <2 x i16> [[TMP3]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret <2 x i16> [[C]]
;
  %b = call <2 x i16> @llvm.bitreverse.v2i16(<2 x i16> %a)
  %c = call <2 x i16> @llvm.bitreverse.v2i16(<2 x i16> %b)
  ret <2 x i16> %c
}

; Undef tests omitted

; Make sure we don't assert during type legalization promoting a large
; bitreverse due to the need for a large shift that won't fit in the i8 returned
; from getShiftAmountTy.
define i528 @large_promotion(i528 %A) nounwind #0 {
; CHECK-LABEL: define i528 @large_promotion(
; CHECK-SAME: i528 [[A:%.*]]) #[[ATTR1]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load i528, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP2:%.*]] = call i528 @llvm.bitreverse.i528(i528 [[TMP1]])
; CHECK-NEXT:    [[Z:%.*]] = call i528 @llvm.bitreverse.i528(i528 [[A]])
; CHECK-NEXT:    store i528 [[TMP2]], ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret i528 [[Z]]
;
  %Z = call i528 @llvm.bitreverse.i528(i528 %A)
  ret i528 %Z
}
declare i528 @llvm.bitreverse.i528(i528)

attributes #0 = { sanitize_memory }
