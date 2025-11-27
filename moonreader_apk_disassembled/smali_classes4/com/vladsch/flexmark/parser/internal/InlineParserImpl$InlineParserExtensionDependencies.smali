.class Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserExtensionDependencies;
.super Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;
.source "InlineParserImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "InlineParserExtensionDependencies"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies<",
        "Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserDependencyStage;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserDependencyStage;",
            ">;)V"
        }
    .end annotation

    .line 44
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;-><init>(Ljava/util/List;)V

    return-void
.end method
