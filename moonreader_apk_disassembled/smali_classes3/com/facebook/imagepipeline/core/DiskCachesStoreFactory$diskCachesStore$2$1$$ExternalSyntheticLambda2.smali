.class public final synthetic Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic f$0:Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda2;->f$0:Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda2;->f$0:Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;

    invoke-static {v0}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->$r8$lambda$3UpBfAjd8OgRWNbeAASFcTR1y3A(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/cache/disk/FileCache;

    move-result-object v0

    return-object v0
.end method
