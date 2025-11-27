.class public interface abstract annotation Lcom/facebook/imagepipeline/request/ImageRequest$CachesLocationsMasks;
.super Ljava/lang/Object;
.source "ImageRequest.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/request/ImageRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2609
    name = "CachesLocationsMasks"
.end annotation


# static fields
.field public static final BITMAP_READ:I = 0x1

.field public static final BITMAP_WRITE:I = 0x2

.field public static final DISK_READ:I = 0x10

.field public static final DISK_WRITE:I = 0x20

.field public static final ENCODED_READ:I = 0x4

.field public static final ENCODED_WRITE:I = 0x8
