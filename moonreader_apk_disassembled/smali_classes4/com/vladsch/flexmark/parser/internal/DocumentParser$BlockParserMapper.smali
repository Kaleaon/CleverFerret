.class Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockParserMapper;
.super Ljava/lang/Object;
.source "DocumentParser.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/Computable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/DocumentParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BlockParserMapper"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/Computable<",
        "Lcom/vladsch/flexmark/util/ast/Block;",
        "Lcom/vladsch/flexmark/parser/block/BlockParser;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockParserMapper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 189
    new-instance v0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockParserMapper;

    invoke-direct {v0}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockParserMapper;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockParserMapper;->INSTANCE:Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockParserMapper;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 191
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compute(Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/util/ast/Block;
    .locals 0

    .line 196
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic compute(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 188
    check-cast p1, Lcom/vladsch/flexmark/parser/block/BlockParser;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/DocumentParser$BlockParserMapper;->compute(Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object p1

    return-object p1
.end method
