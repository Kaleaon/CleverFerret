.class public Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencies;
.super Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;
.source "DocumentParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/DocumentParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ParagraphPreProcessorDependencies"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies<",
        "Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;",
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
            "Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;",
            ">;)V"
        }
    .end annotation

    .line 211
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;-><init>(Ljava/util/List;)V

    return-void
.end method
