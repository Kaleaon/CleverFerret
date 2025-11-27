.class public final enum Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;
.super Ljava/lang/Enum;
.source "ContinuationIndent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

.field public static final enum ALIGN_TO_FIRST:Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

.field public static final enum INDENT_0:Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

.field public static final enum INDENT_1:Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

.field public static final enum INDENT_2:Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

.field public static final enum NONE:Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

    const-string v1, "ALIGN_TO_FIRST"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;->ALIGN_TO_FIRST:Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

    .line 5
    new-instance v1, Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

    const-string v3, "NONE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;->NONE:Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

    .line 6
    new-instance v3, Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

    const-string v5, "INDENT_0"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;->INDENT_0:Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

    .line 7
    new-instance v5, Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

    const-string v7, "INDENT_1"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;->INDENT_1:Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

    .line 8
    new-instance v7, Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

    const-string v9, "INDENT_2"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;->INDENT_2:Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

    const/4 v9, 0x5

    .line 3
    new-array v9, v9, [Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    sput-object v9, Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;->$VALUES:[Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;
    .locals 1

    .line 3
    const-class v0, Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

    return-object p0
.end method

.method public static values()[Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;
    .locals 1

    .line 3
    sget-object v0, Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;->$VALUES:[Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

    invoke-virtual {v0}, [Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vladsch/flexmark/util/format/options/ContinuationIndent;

    return-object v0
.end method
