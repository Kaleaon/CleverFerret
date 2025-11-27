.class public final enum Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;
.super Ljava/lang/Enum;
.source "KeepAtStartOfLine.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;

.field public static final enum ALL:Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;

.field public static final enum JEKYLL:Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;

.field public static final enum NONE:Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;->NONE:Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;

    .line 5
    new-instance v1, Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;

    const-string v3, "JEKYLL"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;->JEKYLL:Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;

    .line 6
    new-instance v3, Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;

    const-string v5, "ALL"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;->ALL:Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;

    const/4 v5, 0x3

    .line 3
    new-array v5, v5, [Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;->$VALUES:[Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;

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

.method public static valueOf(Ljava/lang/String;)Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;
    .locals 1

    .line 3
    const-class v0, Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;

    return-object p0
.end method

.method public static values()[Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;
    .locals 1

    .line 3
    sget-object v0, Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;->$VALUES:[Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;

    invoke-virtual {v0}, [Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vladsch/flexmark/util/format/options/KeepAtStartOfLine;

    return-object v0
.end method
