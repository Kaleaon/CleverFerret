.class public Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyStage;
.super Ljava/lang/Object;
.source "DocumentParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/DocumentParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CustomBlockParserDependencyStage"
.end annotation


# instance fields
.field private final dependents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;",
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
            "Lcom/vladsch/flexmark/parser/block/CustomBlockParserFactory;",
            ">;)V"
        }
    .end annotation

    .line 250
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 252
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyStage;->dependents:Ljava/util/List;

    return-void
.end method

.method static synthetic access$300(Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyStage;)Ljava/util/List;
    .locals 0

    .line 247
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$CustomBlockParserDependencyStage;->dependents:Ljava/util/List;

    return-object p0
.end method
