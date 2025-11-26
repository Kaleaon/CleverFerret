.class public Lcom/facebook/imagepipeline/image/ImageInfoImpl;
.super Ljava/lang/Object;
.source "ImageInfoImpl.java"

# interfaces
.implements Lcom/facebook/imagepipeline/image/ImageInfo;


# instance fields
.field private final extras:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final height:I

.field private final qualityInfo:Lcom/facebook/imagepipeline/image/QualityInfo;

.field private final sizeInBytes:I

.field private final width:I


# direct methods
.method public constructor <init>(IIILcom/facebook/imagepipeline/image/QualityInfo;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III",
            "Lcom/facebook/imagepipeline/image/QualityInfo;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput p1, p0, Lcom/facebook/imagepipeline/image/ImageInfoImpl;->width:I

    .line 25
    iput p2, p0, Lcom/facebook/imagepipeline/image/ImageInfoImpl;->height:I

    .line 26
    iput p3, p0, Lcom/facebook/imagepipeline/image/ImageInfoImpl;->sizeInBytes:I

    .line 27
    iput-object p4, p0, Lcom/facebook/imagepipeline/image/ImageInfoImpl;->qualityInfo:Lcom/facebook/imagepipeline/image/QualityInfo;

    .line 28
    iput-object p5, p0, Lcom/facebook/imagepipeline/image/ImageInfoImpl;->extras:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public getExtras()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 34
    iget-object v0, p0, Lcom/facebook/imagepipeline/image/ImageInfoImpl;->extras:Ljava/util/Map;

    return-object v0
.end method

.method public getHeight()I
    .locals 1

    .line 44
    iget v0, p0, Lcom/facebook/imagepipeline/image/ImageInfoImpl;->height:I

    return v0
.end method

.method public getQualityInfo()Lcom/facebook/imagepipeline/image/QualityInfo;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/facebook/imagepipeline/image/ImageInfoImpl;->qualityInfo:Lcom/facebook/imagepipeline/image/QualityInfo;

    return-object v0
.end method

.method public getSizeInBytes()I
    .locals 1

    .line 49
    iget v0, p0, Lcom/facebook/imagepipeline/image/ImageInfoImpl;->sizeInBytes:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .line 39
    iget v0, p0, Lcom/facebook/imagepipeline/image/ImageInfoImpl;->width:I

    return v0
.end method
