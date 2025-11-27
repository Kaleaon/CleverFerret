.class public final synthetic Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/facebook/common/internal/Predicate;


# instance fields
.field public final synthetic f$0:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Landroid/net/Uri;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda4;->f$0:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Z
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/ImagePipeline$$ExternalSyntheticLambda4;->f$0:Landroid/net/Uri;

    check-cast p1, Lcom/facebook/cache/common/CacheKey;

    invoke-static {v0, p1}, Lcom/facebook/imagepipeline/core/ImagePipeline;->$r8$lambda$0CkmgaNjN345EkV4KcoTJN2a21w(Landroid/net/Uri;Lcom/facebook/cache/common/CacheKey;)Z

    move-result p1

    return p1
.end method
