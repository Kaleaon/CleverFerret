.class public Lorg/mydroid/core/codec/DjvuPageInfo;
.super Lorg/mydroid/core/codec/CodecPageInfo;
.source "DjvuPageInfo.java"


# instance fields
.field public originalHeight:I

.field public originalWidth:I


# direct methods
.method public constructor <init>(Lorg/mydroid/core/codec/CodecPageInfo;)V
    .locals 1

    .line 7
    invoke-direct {p0}, Lorg/mydroid/core/codec/CodecPageInfo;-><init>()V

    .line 8
    iget v0, p1, Lorg/mydroid/core/codec/CodecPageInfo;->height:I

    iput v0, p0, Lorg/mydroid/core/codec/DjvuPageInfo;->originalHeight:I

    .line 9
    iget v0, p1, Lorg/mydroid/core/codec/CodecPageInfo;->width:I

    iput v0, p0, Lorg/mydroid/core/codec/DjvuPageInfo;->originalWidth:I

    .line 10
    iget v0, p1, Lorg/mydroid/core/codec/CodecPageInfo;->width:I

    iput v0, p0, Lorg/mydroid/core/codec/DjvuPageInfo;->width:I

    .line 11
    iget v0, p1, Lorg/mydroid/core/codec/CodecPageInfo;->height:I

    iput v0, p0, Lorg/mydroid/core/codec/DjvuPageInfo;->height:I

    .line 12
    iget v0, p1, Lorg/mydroid/core/codec/CodecPageInfo;->dpi:I

    iput v0, p0, Lorg/mydroid/core/codec/DjvuPageInfo;->dpi:I

    .line 13
    iget v0, p1, Lorg/mydroid/core/codec/CodecPageInfo;->rotation:I

    iput v0, p0, Lorg/mydroid/core/codec/DjvuPageInfo;->rotation:I

    .line 14
    iget p1, p1, Lorg/mydroid/core/codec/CodecPageInfo;->version:I

    iput p1, p0, Lorg/mydroid/core/codec/DjvuPageInfo;->version:I

    return-void
.end method
