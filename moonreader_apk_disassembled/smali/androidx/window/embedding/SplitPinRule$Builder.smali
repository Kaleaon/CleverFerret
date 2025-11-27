.class public final Landroidx/window/embedding/SplitPinRule$Builder;
.super Ljava/lang/Object;
.source "SplitPinRule.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/window/embedding/SplitPinRule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSplitPinRule.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SplitPinRule.kt\nandroidx/window/embedding/SplitPinRule$Builder\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,235:1\n1#2:236\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\n\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0006\u0010\u0010\u001a\u00020\u0011J\u000e\u0010\u0012\u001a\u00020\u00002\u0006\u0010\u0003\u001a\u00020\u0004J\u000e\u0010\u0013\u001a\u00020\u00002\u0006\u0010\u0014\u001a\u00020\u0008J\u000e\u0010\u0015\u001a\u00020\u00002\u0006\u0010\u0014\u001a\u00020\u0008J\u0010\u0010\u0016\u001a\u00020\u00002\u0008\u0008\u0001\u0010\n\u001a\u00020\u000bJ\u0010\u0010\u0017\u001a\u00020\u00002\u0008\u0008\u0001\u0010\u000c\u001a\u00020\u000bJ\u0010\u0010\u0018\u001a\u00020\u00002\u0008\u0008\u0001\u0010\r\u001a\u00020\u000bJ\u000e\u0010\u0019\u001a\u00020\u00002\u0006\u0010\u0005\u001a\u00020\u0006J\u0010\u0010\u001a\u001a\u00020\u00002\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u000fR\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\n\u001a\u00020\u000b8\u0002@\u0002X\u0083\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u000c\u001a\u00020\u000b8\u0002@\u0002X\u0083\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\r\u001a\u00020\u000b8\u0002@\u0002X\u0083\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001b"
    }
    d2 = {
        "Landroidx/window/embedding/SplitPinRule$Builder;",
        "",
        "()V",
        "defaultSplitAttributes",
        "Landroidx/window/embedding/SplitAttributes;",
        "isSticky",
        "",
        "maxAspectRatioInLandscape",
        "Landroidx/window/embedding/EmbeddingAspectRatio;",
        "maxAspectRatioInPortrait",
        "minHeightDp",
        "",
        "minSmallestWidthDp",
        "minWidthDp",
        "tag",
        "",
        "build",
        "Landroidx/window/embedding/SplitPinRule;",
        "setDefaultSplitAttributes",
        "setMaxAspectRatioInLandscape",
        "aspectRatio",
        "setMaxAspectRatioInPortrait",
        "setMinHeightDp",
        "setMinSmallestWidthDp",
        "setMinWidthDp",
        "setSticky",
        "setTag",
        "window_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private defaultSplitAttributes:Landroidx/window/embedding/SplitAttributes;

.field private isSticky:Z

.field private maxAspectRatioInLandscape:Landroidx/window/embedding/EmbeddingAspectRatio;

.field private maxAspectRatioInPortrait:Landroidx/window/embedding/EmbeddingAspectRatio;

.field private minHeightDp:I

.field private minSmallestWidthDp:I

.field private minWidthDp:I

.field private tag:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x258

    .line 61
    iput v0, p0, Landroidx/window/embedding/SplitPinRule$Builder;->minWidthDp:I

    .line 62
    iput v0, p0, Landroidx/window/embedding/SplitPinRule$Builder;->minHeightDp:I

    .line 63
    iput v0, p0, Landroidx/window/embedding/SplitPinRule$Builder;->minSmallestWidthDp:I

    .line 64
    sget-object v0, Landroidx/window/embedding/SplitRule;->SPLIT_MAX_ASPECT_RATIO_PORTRAIT_DEFAULT:Landroidx/window/embedding/EmbeddingAspectRatio;

    iput-object v0, p0, Landroidx/window/embedding/SplitPinRule$Builder;->maxAspectRatioInPortrait:Landroidx/window/embedding/EmbeddingAspectRatio;

    .line 65
    sget-object v0, Landroidx/window/embedding/SplitRule;->SPLIT_MAX_ASPECT_RATIO_LANDSCAPE_DEFAULT:Landroidx/window/embedding/EmbeddingAspectRatio;

    iput-object v0, p0, Landroidx/window/embedding/SplitPinRule$Builder;->maxAspectRatioInLandscape:Landroidx/window/embedding/EmbeddingAspectRatio;

    .line 66
    new-instance v0, Landroidx/window/embedding/SplitAttributes$Builder;

    invoke-direct {v0}, Landroidx/window/embedding/SplitAttributes$Builder;-><init>()V

    invoke-virtual {v0}, Landroidx/window/embedding/SplitAttributes$Builder;->build()Landroidx/window/embedding/SplitAttributes;

    move-result-object v0

    iput-object v0, p0, Landroidx/window/embedding/SplitPinRule$Builder;->defaultSplitAttributes:Landroidx/window/embedding/SplitAttributes;

    return-void
.end method


# virtual methods
.method public final build()Landroidx/window/embedding/SplitPinRule;
    .locals 9

    .line 201
    new-instance v0, Landroidx/window/embedding/SplitPinRule;

    .line 202
    iget-object v1, p0, Landroidx/window/embedding/SplitPinRule$Builder;->tag:Ljava/lang/String;

    .line 203
    iget-object v2, p0, Landroidx/window/embedding/SplitPinRule$Builder;->defaultSplitAttributes:Landroidx/window/embedding/SplitAttributes;

    .line 204
    iget-boolean v3, p0, Landroidx/window/embedding/SplitPinRule$Builder;->isSticky:Z

    .line 205
    iget v4, p0, Landroidx/window/embedding/SplitPinRule$Builder;->minWidthDp:I

    .line 206
    iget v5, p0, Landroidx/window/embedding/SplitPinRule$Builder;->minHeightDp:I

    .line 207
    iget v6, p0, Landroidx/window/embedding/SplitPinRule$Builder;->minSmallestWidthDp:I

    .line 208
    iget-object v7, p0, Landroidx/window/embedding/SplitPinRule$Builder;->maxAspectRatioInPortrait:Landroidx/window/embedding/EmbeddingAspectRatio;

    .line 209
    iget-object v8, p0, Landroidx/window/embedding/SplitPinRule$Builder;->maxAspectRatioInLandscape:Landroidx/window/embedding/EmbeddingAspectRatio;

    .line 201
    invoke-direct/range {v0 .. v8}, Landroidx/window/embedding/SplitPinRule;-><init>(Ljava/lang/String;Landroidx/window/embedding/SplitAttributes;ZIIILandroidx/window/embedding/EmbeddingAspectRatio;Landroidx/window/embedding/EmbeddingAspectRatio;)V

    return-object v0
.end method

.method public final setDefaultSplitAttributes(Landroidx/window/embedding/SplitAttributes;)Landroidx/window/embedding/SplitPinRule$Builder;
    .locals 1

    const-string v0, "defaultSplitAttributes"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 174
    move-object v0, p0

    check-cast v0, Landroidx/window/embedding/SplitPinRule$Builder;

    .line 175
    iput-object p1, p0, Landroidx/window/embedding/SplitPinRule$Builder;->defaultSplitAttributes:Landroidx/window/embedding/SplitAttributes;

    return-object p0
.end method

.method public final setMaxAspectRatioInLandscape(Landroidx/window/embedding/EmbeddingAspectRatio;)Landroidx/window/embedding/SplitPinRule$Builder;
    .locals 1

    const-string v0, "aspectRatio"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 162
    move-object v0, p0

    check-cast v0, Landroidx/window/embedding/SplitPinRule$Builder;

    .line 163
    iput-object p1, p0, Landroidx/window/embedding/SplitPinRule$Builder;->maxAspectRatioInLandscape:Landroidx/window/embedding/EmbeddingAspectRatio;

    return-object p0
.end method

.method public final setMaxAspectRatioInPortrait(Landroidx/window/embedding/EmbeddingAspectRatio;)Landroidx/window/embedding/SplitPinRule$Builder;
    .locals 1

    const-string v0, "aspectRatio"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 140
    move-object v0, p0

    check-cast v0, Landroidx/window/embedding/SplitPinRule$Builder;

    .line 141
    iput-object p1, p0, Landroidx/window/embedding/SplitPinRule$Builder;->maxAspectRatioInPortrait:Landroidx/window/embedding/EmbeddingAspectRatio;

    return-object p0
.end method

.method public final setMinHeightDp(I)Landroidx/window/embedding/SplitPinRule$Builder;
    .locals 1

    .line 102
    move-object v0, p0

    check-cast v0, Landroidx/window/embedding/SplitPinRule$Builder;

    .line 103
    iput p1, p0, Landroidx/window/embedding/SplitPinRule$Builder;->minHeightDp:I

    return-object p0
.end method

.method public final setMinSmallestWidthDp(I)Landroidx/window/embedding/SplitPinRule$Builder;
    .locals 1

    .line 118
    move-object v0, p0

    check-cast v0, Landroidx/window/embedding/SplitPinRule$Builder;

    .line 119
    iput p1, p0, Landroidx/window/embedding/SplitPinRule$Builder;->minSmallestWidthDp:I

    return-object p0
.end method

.method public final setMinWidthDp(I)Landroidx/window/embedding/SplitPinRule$Builder;
    .locals 1

    .line 81
    move-object v0, p0

    check-cast v0, Landroidx/window/embedding/SplitPinRule$Builder;

    .line 82
    iput p1, p0, Landroidx/window/embedding/SplitPinRule$Builder;->minWidthDp:I

    return-object p0
.end method

.method public final setSticky(Z)Landroidx/window/embedding/SplitPinRule$Builder;
    .locals 1

    .line 193
    move-object v0, p0

    check-cast v0, Landroidx/window/embedding/SplitPinRule$Builder;

    iput-boolean p1, p0, Landroidx/window/embedding/SplitPinRule$Builder;->isSticky:Z

    return-object p0
.end method

.method public final setTag(Ljava/lang/String;)Landroidx/window/embedding/SplitPinRule$Builder;
    .locals 1

    .line 185
    move-object v0, p0

    check-cast v0, Landroidx/window/embedding/SplitPinRule$Builder;

    iput-object p1, p0, Landroidx/window/embedding/SplitPinRule$Builder;->tag:Ljava/lang/String;

    return-object p0
.end method
