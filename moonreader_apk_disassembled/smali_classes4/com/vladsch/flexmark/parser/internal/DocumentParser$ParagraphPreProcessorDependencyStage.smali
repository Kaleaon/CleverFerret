.class public Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;
.super Ljava/lang/Object;
.source "DocumentParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/DocumentParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ParagraphPreProcessorDependencyStage"
.end annotation


# instance fields
.field private final dependents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;",
            ">;)V"
        }
    .end annotation

    .line 218
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 220
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;->dependents:Ljava/util/List;

    return-void
.end method

.method static synthetic access$600(Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;)Ljava/util/List;
    .locals 0

    .line 215
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$ParagraphPreProcessorDependencyStage;->dependents:Ljava/util/List;

    return-object p0
.end method
