.class public final enum Lcom/vladsch/flexmark/parser/block/ParserPhase;
.super Ljava/lang/Enum;
.source "ParserPhase.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/vladsch/flexmark/parser/block/ParserPhase;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vladsch/flexmark/parser/block/ParserPhase;

.field public static final enum DONE:Lcom/vladsch/flexmark/parser/block/ParserPhase;

.field public static final enum NONE:Lcom/vladsch/flexmark/parser/block/ParserPhase;

.field public static final enum PARSE_BLOCKS:Lcom/vladsch/flexmark/parser/block/ParserPhase;

.field public static final enum PARSE_INLINES:Lcom/vladsch/flexmark/parser/block/ParserPhase;

.field public static final enum PRE_PROCESS_BLOCKS:Lcom/vladsch/flexmark/parser/block/ParserPhase;

.field public static final enum PRE_PROCESS_PARAGRAPHS:Lcom/vladsch/flexmark/parser/block/ParserPhase;

.field public static final enum STARTING:Lcom/vladsch/flexmark/parser/block/ParserPhase;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 9
    new-instance v0, Lcom/vladsch/flexmark/parser/block/ParserPhase;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/parser/block/ParserPhase;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vladsch/flexmark/parser/block/ParserPhase;->NONE:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    .line 10
    new-instance v1, Lcom/vladsch/flexmark/parser/block/ParserPhase;

    const-string v3, "STARTING"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/parser/block/ParserPhase;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/vladsch/flexmark/parser/block/ParserPhase;->STARTING:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    .line 11
    new-instance v3, Lcom/vladsch/flexmark/parser/block/ParserPhase;

    const-string v5, "PARSE_BLOCKS"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/vladsch/flexmark/parser/block/ParserPhase;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/vladsch/flexmark/parser/block/ParserPhase;->PARSE_BLOCKS:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    .line 12
    new-instance v5, Lcom/vladsch/flexmark/parser/block/ParserPhase;

    const-string v7, "PRE_PROCESS_PARAGRAPHS"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/vladsch/flexmark/parser/block/ParserPhase;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/vladsch/flexmark/parser/block/ParserPhase;->PRE_PROCESS_PARAGRAPHS:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    .line 13
    new-instance v7, Lcom/vladsch/flexmark/parser/block/ParserPhase;

    const-string v9, "PRE_PROCESS_BLOCKS"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/vladsch/flexmark/parser/block/ParserPhase;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/vladsch/flexmark/parser/block/ParserPhase;->PRE_PROCESS_BLOCKS:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    .line 14
    new-instance v9, Lcom/vladsch/flexmark/parser/block/ParserPhase;

    const-string v11, "PARSE_INLINES"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/vladsch/flexmark/parser/block/ParserPhase;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/vladsch/flexmark/parser/block/ParserPhase;->PARSE_INLINES:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    .line 15
    new-instance v11, Lcom/vladsch/flexmark/parser/block/ParserPhase;

    const-string v13, "DONE"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/vladsch/flexmark/parser/block/ParserPhase;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/vladsch/flexmark/parser/block/ParserPhase;->DONE:Lcom/vladsch/flexmark/parser/block/ParserPhase;

    const/4 v13, 0x7

    .line 8
    new-array v13, v13, [Lcom/vladsch/flexmark/parser/block/ParserPhase;

    aput-object v0, v13, v2

    aput-object v1, v13, v4

    aput-object v3, v13, v6

    aput-object v5, v13, v8

    aput-object v7, v13, v10

    aput-object v9, v13, v12

    aput-object v11, v13, v14

    sput-object v13, Lcom/vladsch/flexmark/parser/block/ParserPhase;->$VALUES:[Lcom/vladsch/flexmark/parser/block/ParserPhase;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 8
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vladsch/flexmark/parser/block/ParserPhase;
    .locals 1

    .line 8
    const-class v0, Lcom/vladsch/flexmark/parser/block/ParserPhase;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/parser/block/ParserPhase;

    return-object p0
.end method

.method public static values()[Lcom/vladsch/flexmark/parser/block/ParserPhase;
    .locals 1

    .line 8
    sget-object v0, Lcom/vladsch/flexmark/parser/block/ParserPhase;->$VALUES:[Lcom/vladsch/flexmark/parser/block/ParserPhase;

    invoke-virtual {v0}, [Lcom/vladsch/flexmark/parser/block/ParserPhase;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vladsch/flexmark/parser/block/ParserPhase;

    return-object v0
.end method
