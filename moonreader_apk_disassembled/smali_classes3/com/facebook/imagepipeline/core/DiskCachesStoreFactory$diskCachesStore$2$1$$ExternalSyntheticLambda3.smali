.class public final synthetic Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic f$0:Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;

.field public final synthetic f$1:Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda3;->f$0:Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;

    iput-object p2, p0, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda3;->f$1:Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda3;->f$0:Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;

    iget-object v1, p0, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1$$ExternalSyntheticLambda3;->f$1:Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;

    invoke-static {v0, v1}, Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;->$r8$lambda$apTyEB63NskwOR7jKmBrcxFUihM(Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory$diskCachesStore$2$1;Lcom/facebook/imagepipeline/core/DiskCachesStoreFactory;)Lcom/facebook/imagepipeline/cache/BufferedDiskCache;

    move-result-object v0

    return-object v0
.end method
