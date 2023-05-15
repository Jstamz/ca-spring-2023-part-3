#/-------------------------------------------------------------------------------------------------
#/ 4190.308 Computer Architecture                                                       Spring 2023
#/
#// @file
#// @brief Image blending (vector operations)
#//        This module implements a function that blends two images together filter (assembly 
#//        integer vector version)
#//
#//
#// @section changelog Change Log
#// 2023/MM/DD Your Name Comment
#//
#/-------------------------------------------------------------------------------------------------

    .option nopic
    .attribute unaligned_access, 0
    .attribute stack_align, 16

    .text
    .align 4
    .globl blend_asm
    .type  blend_asm, @function

# struct Image {                 Ofs
#     uint8 *data;                 0
#     int height;                  4
#     int width;                   8
#     int channels;               12
# };

# int blend_asm(                 Reg
#       struct Image *blended,    a0
#       struct Image *img1,       a1
#       struct Image *img2,       a2
#       int overlay,              a3
#       int alpha                 a4
#     )
blend_asm:
    # Check parameters
    li    t0, 1
    bne   a3, t0, .OverlayError   # if overlay != 1 goto .OverlayError

    lw    t1, 12(a1)              # t1 = img1->channels
    lw    t2, 12(a2)              # t2 = img2->channels
    li    t0, 4
    bne   t1, t0, .ChannelError   # if img1->channels != 4 goto .ChannelError
    bne   t2, t0, .ChannelError   # if img2->channels != 4 goto .ChannelError

    # more error checks if deemed necessary


    # Initialize blended image
    # TDDO

    # Blend
    # TDDO

    mv    a0, x0
    ret

.OverlayError:
    li    a0, -1
    ret

.ChannelError:
    li    a0, -2
    ret

