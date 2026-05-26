module {

func.func @sobel_x(%img: memref<64x64xi32>, %Ix: memref<64x64xi32>) {
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
      %c2 = arith.constant 2 : i32
      %t0 = arith.muli %v01, %c2 : i32
      %t1 = arith.muli %v21, %c2 : i32
      %neg_v00 = arith.subi %v02, %v00 : i32
      %neg_v20 = arith.subi %v22, %v20 : i32
      %s0 = arith.addi %neg_v00, %t0 : i32
      %s1 = arith.subi %s0, %t1 : i32
      %gx = arith.addi %s1, %neg_v20 : i32
      affine.store %gx, %Ix[%i, %j] : memref<64x64xi32>
    }
  }
  return
}

func.func @sobel_y(%img: memref<64x64xi32>, %Iy: memref<64x64xi32>) {
  affine.for %i = 1 to 63 {
    affine.for %j = 1 to 63 {
      %v00 = affine.load %img[%i - 1, %j - 1] : memref<64x64xi32>
      %v02 = affine.load %img[%i - 1, %j + 1] : memref<64x64xi32>
      %v10 = affine.load %img[%i,     %j - 1] : memref<64x64xi32>
      %v12 = affine.load %img[%i,     %j + 1] : memref<64x64xi32>
      %v20 = affine.load %img[%i + 1, %j - 1] : memref<64x64xi32>
      %v22 = affine.load %img[%i + 1, %j + 1] : memref<64x64xi32>
      %c2 = arith.constant 2 : i32
      %t0 = arith.muli %v10, %c2 : i32
      %t1 = arith.muli %v12, %c2 : i32
      %neg_v00 = arith.subi %v20, %v00 : i32
      %neg_v02 = arith.subi %v22, %v02 : i32
      %s0 = arith.addi %neg_v00, %t0 : i32
      %s1 = arith.subi %s0, %t1 : i32
      %gy = arith.addi %s1, %neg_v02 : i32
      affine.store %gy, %Iy[%i, %j] : memref<64x64xi32>
    }
  }
  return
}

func.func @ixx(%Ix: memref<64x64xi32>, %Ixx: memref<64x64xi32>) {
  affine.for %i = 1 to 63 {
    affine.for %j = 1 to 63 {
      %v = affine.load %Ix[%i, %j] : memref<64x64xi32>
      %r = arith.muli %v, %v : i32
      affine.store %r, %Ixx[%i, %j] : memref<64x64xi32>
    }
  }
  return
}

func.func @iyy(%Iy: memref<64x64xi32>, %Iyy: memref<64x64xi32>) {
  affine.for %i = 1 to 63 {
    affine.for %j = 1 to 63 {
      %v = affine.load %Iy[%i, %j] : memref<64x64xi32>
      %r = arith.muli %v, %v : i32
      affine.store %r, %Iyy[%i, %j] : memref<64x64xi32>
    }
  }
  return
}

func.func @ixy(%Ix: memref<64x64xi32>, %Iy: memref<64x64xi32>,
                %Ixy: memref<64x64xi32>) {
  affine.for %i = 1 to 63 {
    affine.for %j = 1 to 63 {
      %vx = affine.load %Ix[%i, %j] : memref<64x64xi32>
      %vy = affine.load %Iy[%i, %j] : memref<64x64xi32>
      %r = arith.muli %vx, %vy : i32
      affine.store %r, %Ixy[%i, %j] : memref<64x64xi32>
    }
  }
  return
}

func.func @gaussian_blur(%Ixx: memref<64x64xi32>, %Iyy: memref<64x64xi32>,
                          %Ixy: memref<64x64xi32>,
                          %Sxx: memref<64x64xi32>, %Syy: memref<64x64xi32>,
                          %Sxy: memref<64x64xi32>) {
  affine.for %i = 2 to 62 {
    affine.for %j = 2 to 62 {
      %a00 = affine.load %Ixx[%i - 1, %j - 1] : memref<64x64xi32>
      %a01 = affine.load %Ixx[%i - 1, %j]     : memref<64x64xi32>
      %a02 = affine.load %Ixx[%i - 1, %j + 1] : memref<64x64xi32>
      %a10 = affine.load %Ixx[%i,     %j - 1] : memref<64x64xi32>
      %a11 = affine.load %Ixx[%i,     %j]     : memref<64x64xi32>
      %a12 = affine.load %Ixx[%i,     %j + 1] : memref<64x64xi32>
      %a20 = affine.load %Ixx[%i + 1, %j - 1] : memref<64x64xi32>
      %a21 = affine.load %Ixx[%i + 1, %j]     : memref<64x64xi32>
      %a22 = affine.load %Ixx[%i + 1, %j + 1] : memref<64x64xi32>
      %c2 = arith.constant 2 : i32
      %c4 = arith.constant 4 : i32
      %c16 = arith.constant 16 : i32
      %m11 = arith.muli %a11, %c4 : i32
      %m01 = arith.muli %a01, %c2 : i32
      %m10 = arith.muli %a10, %c2 : i32
      %m12 = arith.muli %a12, %c2 : i32
      %m21 = arith.muli %a21, %c2 : i32
      %s0 = arith.addi %a00, %m01 : i32
      %s1 = arith.addi %s0, %a02 : i32
      %s2 = arith.addi %s1, %m10 : i32
      %s3 = arith.addi %s2, %m11 : i32
      %s4 = arith.addi %s3, %m12 : i32
      %s5 = arith.addi %s4, %a20 : i32
      %s6 = arith.addi %s5, %m21 : i32
      %s7 = arith.addi %s6, %a22 : i32
      %r = arith.divsi %s7, %c16 : i32
      affine.store %r, %Sxx[%i, %j] : memref<64x64xi32>
    }
  }

  affine.for %i2 = 2 to 62 {
    affine.for %j2 = 2 to 62 {
      %b00 = affine.load %Iyy[%i2 - 1, %j2 - 1] : memref<64x64xi32>
      %b01 = affine.load %Iyy[%i2 - 1, %j2]     : memref<64x64xi32>
      %b02 = affine.load %Iyy[%i2 - 1, %j2 + 1] : memref<64x64xi32>
      %b10 = affine.load %Iyy[%i2,     %j2 - 1] : memref<64x64xi32>
      %b11 = affine.load %Iyy[%i2,     %j2]     : memref<64x64xi32>
      %b12 = affine.load %Iyy[%i2,     %j2 + 1] : memref<64x64xi32>
      %b20 = affine.load %Iyy[%i2 + 1, %j2 - 1] : memref<64x64xi32>
      %b21 = affine.load %Iyy[%i2 + 1, %j2]     : memref<64x64xi32>
      %b22 = affine.load %Iyy[%i2 + 1, %j2 + 1] : memref<64x64xi32>
      %c2b = arith.constant 2 : i32
      %c4b = arith.constant 4 : i32
      %c16b = arith.constant 16 : i32
      %mb11 = arith.muli %b11, %c4b : i32
      %mb01 = arith.muli %b01, %c2b : i32
      %mb10 = arith.muli %b10, %c2b : i32
      %mb12 = arith.muli %b12, %c2b : i32
      %mb21 = arith.muli %b21, %c2b : i32
      %sb0 = arith.addi %b00, %mb01 : i32
      %sb1 = arith.addi %sb0, %b02 : i32
      %sb2 = arith.addi %sb1, %mb10 : i32
      %sb3 = arith.addi %sb2, %mb11 : i32
      %sb4 = arith.addi %sb3, %mb12 : i32
      %sb5 = arith.addi %sb4, %b20 : i32
      %sb6 = arith.addi %sb5, %mb21 : i32
      %sb7 = arith.addi %sb6, %b22 : i32
      %rb = arith.divsi %sb7, %c16b : i32
      affine.store %rb, %Syy[%i2, %j2] : memref<64x64xi32>
    }
  }

  affine.for %i3 = 2 to 62 {
    affine.for %j3 = 2 to 62 {
      %c00 = affine.load %Ixy[%i3 - 1, %j3 - 1] : memref<64x64xi32>
      %c01 = affine.load %Ixy[%i3 - 1, %j3]     : memref<64x64xi32>
      %c02 = affine.load %Ixy[%i3 - 1, %j3 + 1] : memref<64x64xi32>
      %c10 = affine.load %Ixy[%i3,     %j3 - 1] : memref<64x64xi32>
      %c11 = affine.load %Ixy[%i3,     %j3]     : memref<64x64xi32>
      %c12 = affine.load %Ixy[%i3,     %j3 + 1] : memref<64x64xi32>
      %c20 = affine.load %Ixy[%i3 + 1, %j3 - 1] : memref<64x64xi32>
      %c21 = affine.load %Ixy[%i3 + 1, %j3]     : memref<64x64xi32>
      %c22 = affine.load %Ixy[%i3 + 1, %j3 + 1] : memref<64x64xi32>
      %c2c = arith.constant 2 : i32
      %c4c = arith.constant 4 : i32
      %c16c = arith.constant 16 : i32
      %mc11 = arith.muli %c11, %c4c : i32
      %mc01 = arith.muli %c01, %c2c : i32
      %mc10 = arith.muli %c10, %c2c : i32
      %mc12 = arith.muli %c12, %c2c : i32
      %mc21 = arith.muli %c21, %c2c : i32
      %sc0 = arith.addi %c00, %mc01 : i32
      %sc1 = arith.addi %sc0, %c02 : i32
      %sc2 = arith.addi %sc1, %mc10 : i32
      %sc3 = arith.addi %sc2, %mc11 : i32
      %sc4 = arith.addi %sc3, %mc12 : i32
      %sc5 = arith.addi %sc4, %c20 : i32
      %sc6 = arith.addi %sc5, %mc21 : i32
      %sc7 = arith.addi %sc6, %c22 : i32
      %rc = arith.divsi %sc7, %c16c : i32
      affine.store %rc, %Sxy[%i3, %j3] : memref<64x64xi32>
    }
  }
  return
}

func.func @corner_response(%Sxx: memref<64x64xi32>, %Syy: memref<64x64xi32>,
                            %Sxy: memref<64x64xi32>, %R: memref<64x64xi32>) {
  %k = arith.constant 4 : i32
  affine.for %i = 2 to 62 {
    affine.for %j = 2 to 62 {
      %sxx = affine.load %Sxx[%i, %j] : memref<64x64xi32>
      %syy = affine.load %Syy[%i, %j] : memref<64x64xi32>
      %sxy = affine.load %Sxy[%i, %j] : memref<64x64xi32>
      %det_a = arith.muli %sxx, %syy : i32
      %det_b = arith.muli %sxy, %sxy : i32
      %det = arith.subi %det_a, %det_b : i32
      %trace = arith.addi %sxx, %syy : i32
      %trace_sq = arith.muli %trace, %trace : i32
      %k_trace = arith.muli %k, %trace_sq : i32
      %r = arith.subi %det, %k_trace : i32
      affine.store %r, %R[%i, %j] : memref<64x64xi32>
    }
  }
  return
}

}
