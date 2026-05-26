module {

func.func @harris(%img: memref<64x64xi32>,
                   %Ix: memref<64x64xi32>, %Iy: memref<64x64xi32>,
                   %Ixx: memref<64x64xi32>, %Iyy: memref<64x64xi32>,
                   %Ixy: memref<64x64xi32>,
                   %Sxx: memref<64x64xi32>, %Syy: memref<64x64xi32>,
                   %Sxy: memref<64x64xi32>, %R: memref<64x64xi32>) {
  %c2 = arith.constant 2 : i32
  %c4 = arith.constant 4 : i32
  %c16 = arith.constant 16 : i32

  affine.for %i = 1 to 63 {
    affine.for %j = 1 to 63 {
      %v00 = affine.load %img[%i - 1, %j - 1] : memref<64x64xi32>
      %v01 = affine.load %img[%i - 1, %j]     : memref<64x64xi32>
      %v02 = affine.load %img[%i - 1, %j + 1] : memref<64x64xi32>
      %v10 = affine.load %img[%i,     %j - 1] : memref<64x64xi32>
      %v12 = affine.load %img[%i,     %j + 1] : memref<64x64xi32>
      %v20 = affine.load %img[%i + 1, %j - 1] : memref<64x64xi32>
      %v21 = affine.load %img[%i + 1, %j]     : memref<64x64xi32>
      %v22 = affine.load %img[%i + 1, %j + 1] : memref<64x64xi32>
      %t0 = arith.muli %v01, %c2 : i32
      %t1 = arith.muli %v21, %c2 : i32
      %d0 = arith.subi %v02, %v00 : i32
      %d1 = arith.subi %v22, %v20 : i32
      %s0 = arith.addi %d0, %t0 : i32
      %s1 = arith.subi %s0, %t1 : i32
      %gx = arith.addi %s1, %d1 : i32
      affine.store %gx, %Ix[%i, %j] : memref<64x64xi32>
    }
  }

  affine.for %i2 = 1 to 63 {
    affine.for %j2 = 1 to 63 {
      %v00b = affine.load %img[%i2 - 1, %j2 - 1] : memref<64x64xi32>
      %v02b = affine.load %img[%i2 - 1, %j2 + 1] : memref<64x64xi32>
      %v10b = affine.load %img[%i2,     %j2 - 1] : memref<64x64xi32>
      %v12b = affine.load %img[%i2,     %j2 + 1] : memref<64x64xi32>
      %v20b = affine.load %img[%i2 + 1, %j2 - 1] : memref<64x64xi32>
      %v22b = affine.load %img[%i2 + 1, %j2 + 1] : memref<64x64xi32>
      %t0b = arith.muli %v10b, %c2 : i32
      %t1b = arith.muli %v12b, %c2 : i32
      %d0b = arith.subi %v20b, %v00b : i32
      %d1b = arith.subi %v22b, %v02b : i32
      %s0b = arith.addi %d0b, %t0b : i32
      %s1b = arith.subi %s0b, %t1b : i32
      %gy = arith.addi %s1b, %d1b : i32
      affine.store %gy, %Iy[%i2, %j2] : memref<64x64xi32>
    }
  }

  affine.for %i3 = 1 to 63 {
    affine.for %j3 = 1 to 63 {
      %vx = affine.load %Ix[%i3, %j3] : memref<64x64xi32>
      %rxx = arith.muli %vx, %vx : i32
      affine.store %rxx, %Ixx[%i3, %j3] : memref<64x64xi32>
    }
  }

  affine.for %i4 = 1 to 63 {
    affine.for %j4 = 1 to 63 {
      %vy = affine.load %Iy[%i4, %j4] : memref<64x64xi32>
      %ryy = arith.muli %vy, %vy : i32
      affine.store %ryy, %Iyy[%i4, %j4] : memref<64x64xi32>
    }
  }

  affine.for %i5 = 1 to 63 {
    affine.for %j5 = 1 to 63 {
      %vx2 = affine.load %Ix[%i5, %j5] : memref<64x64xi32>
      %vy2 = affine.load %Iy[%i5, %j5] : memref<64x64xi32>
      %rxy = arith.muli %vx2, %vy2 : i32
      affine.store %rxy, %Ixy[%i5, %j5] : memref<64x64xi32>
    }
  }

  affine.for %i6 = 2 to 62 {
    affine.for %j6 = 2 to 62 {
      %a00 = affine.load %Ixx[%i6 - 1, %j6 - 1] : memref<64x64xi32>
      %a01 = affine.load %Ixx[%i6 - 1, %j6]     : memref<64x64xi32>
      %a02 = affine.load %Ixx[%i6 - 1, %j6 + 1] : memref<64x64xi32>
      %a10 = affine.load %Ixx[%i6,     %j6 - 1] : memref<64x64xi32>
      %a11 = affine.load %Ixx[%i6,     %j6]     : memref<64x64xi32>
      %a12 = affine.load %Ixx[%i6,     %j6 + 1] : memref<64x64xi32>
      %a20 = affine.load %Ixx[%i6 + 1, %j6 - 1] : memref<64x64xi32>
      %a21 = affine.load %Ixx[%i6 + 1, %j6]     : memref<64x64xi32>
      %a22 = affine.load %Ixx[%i6 + 1, %j6 + 1] : memref<64x64xi32>
      %m11 = arith.muli %a11, %c4 : i32
      %m01 = arith.muli %a01, %c2 : i32
      %m10 = arith.muli %a10, %c2 : i32
      %m12 = arith.muli %a12, %c2 : i32
      %m21 = arith.muli %a21, %c2 : i32
      %sa0 = arith.addi %a00, %m01 : i32
      %sa1 = arith.addi %sa0, %a02 : i32
      %sa2 = arith.addi %sa1, %m10 : i32
      %sa3 = arith.addi %sa2, %m11 : i32
      %sa4 = arith.addi %sa3, %m12 : i32
      %sa5 = arith.addi %sa4, %a20 : i32
      %sa6 = arith.addi %sa5, %m21 : i32
      %sa7 = arith.addi %sa6, %a22 : i32
      %ra = arith.divsi %sa7, %c16 : i32
      affine.store %ra, %Sxx[%i6, %j6] : memref<64x64xi32>
    }
  }

  affine.for %i7 = 2 to 62 {
    affine.for %j7 = 2 to 62 {
      %b00 = affine.load %Iyy[%i7 - 1, %j7 - 1] : memref<64x64xi32>
      %b01 = affine.load %Iyy[%i7 - 1, %j7]     : memref<64x64xi32>
      %b02 = affine.load %Iyy[%i7 - 1, %j7 + 1] : memref<64x64xi32>
      %b10 = affine.load %Iyy[%i7,     %j7 - 1] : memref<64x64xi32>
      %b11 = affine.load %Iyy[%i7,     %j7]     : memref<64x64xi32>
      %b12 = affine.load %Iyy[%i7,     %j7 + 1] : memref<64x64xi32>
      %b20 = affine.load %Iyy[%i7 + 1, %j7 - 1] : memref<64x64xi32>
      %b21 = affine.load %Iyy[%i7 + 1, %j7]     : memref<64x64xi32>
      %b22 = affine.load %Iyy[%i7 + 1, %j7 + 1] : memref<64x64xi32>
      %mb11 = arith.muli %b11, %c4 : i32
      %mb01 = arith.muli %b01, %c2 : i32
      %mb10 = arith.muli %b10, %c2 : i32
      %mb12 = arith.muli %b12, %c2 : i32
      %mb21 = arith.muli %b21, %c2 : i32
      %sb0 = arith.addi %b00, %mb01 : i32
      %sb1 = arith.addi %sb0, %b02 : i32
      %sb2 = arith.addi %sb1, %mb10 : i32
      %sb3 = arith.addi %sb2, %mb11 : i32
      %sb4 = arith.addi %sb3, %mb12 : i32
      %sb5 = arith.addi %sb4, %b20 : i32
      %sb6 = arith.addi %sb5, %mb21 : i32
      %sb7 = arith.addi %sb6, %b22 : i32
      %rb = arith.divsi %sb7, %c16 : i32
      affine.store %rb, %Syy[%i7, %j7] : memref<64x64xi32>
    }
  }

  affine.for %i8 = 2 to 62 {
    affine.for %j8 = 2 to 62 {
      %cc00 = affine.load %Ixy[%i8 - 1, %j8 - 1] : memref<64x64xi32>
      %cc01 = affine.load %Ixy[%i8 - 1, %j8]     : memref<64x64xi32>
      %cc02 = affine.load %Ixy[%i8 - 1, %j8 + 1] : memref<64x64xi32>
      %cc10 = affine.load %Ixy[%i8,     %j8 - 1] : memref<64x64xi32>
      %cc11 = affine.load %Ixy[%i8,     %j8]     : memref<64x64xi32>
      %cc12 = affine.load %Ixy[%i8,     %j8 + 1] : memref<64x64xi32>
      %cc20 = affine.load %Ixy[%i8 + 1, %j8 - 1] : memref<64x64xi32>
      %cc21 = affine.load %Ixy[%i8 + 1, %j8]     : memref<64x64xi32>
      %cc22 = affine.load %Ixy[%i8 + 1, %j8 + 1] : memref<64x64xi32>
      %mc11 = arith.muli %cc11, %c4 : i32
      %mc01 = arith.muli %cc01, %c2 : i32
      %mc10 = arith.muli %cc10, %c2 : i32
      %mc12 = arith.muli %cc12, %c2 : i32
      %mc21 = arith.muli %cc21, %c2 : i32
      %sc0 = arith.addi %cc00, %mc01 : i32
      %sc1 = arith.addi %sc0, %cc02 : i32
      %sc2 = arith.addi %sc1, %mc10 : i32
      %sc3 = arith.addi %sc2, %mc11 : i32
      %sc4 = arith.addi %sc3, %mc12 : i32
      %sc5 = arith.addi %sc4, %cc20 : i32
      %sc6 = arith.addi %sc5, %mc21 : i32
      %sc7 = arith.addi %sc6, %cc22 : i32
      %rc = arith.divsi %sc7, %c16 : i32
      affine.store %rc, %Sxy[%i8, %j8] : memref<64x64xi32>
    }
  }

  affine.for %i9 = 2 to 62 {
    affine.for %j9 = 2 to 62 {
      %sxx = affine.load %Sxx[%i9, %j9] : memref<64x64xi32>
      %syy = affine.load %Syy[%i9, %j9] : memref<64x64xi32>
      %sxy = affine.load %Sxy[%i9, %j9] : memref<64x64xi32>
      %det_a = arith.muli %sxx, %syy : i32
      %det_b = arith.muli %sxy, %sxy : i32
      %det = arith.subi %det_a, %det_b : i32
      %trace = arith.addi %sxx, %syy : i32
      %trace_sq = arith.muli %trace, %trace : i32
      %k_trace = arith.muli %c4, %trace_sq : i32
      %resp = arith.subi %det, %k_trace : i32
      affine.store %resp, %R[%i9, %j9] : memref<64x64xi32>
    }
  }

  return
}

}
