.class public final enum Lcom/vladsch/flexmark/util/html/CellAlignment;
.super Ljava/lang/Enum;
.source "CellAlignment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/vladsch/flexmark/util/html/CellAlignment;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vladsch/flexmark/util/html/CellAlignment;

.field public static final enum CENTER:Lcom/vladsch/flexmark/util/html/CellAlignment;

.field public static final enum LEFT:Lcom/vladsch/flexmark/util/html/CellAlignment;

.field public static final enum NONE:Lcom/vladsch/flexmark/util/html/CellAlignment;

.field public static final enum RIGHT:Lcom/vladsch/flexmark/util/html/CellAlignment;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/util/html/CellAlignment;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/html/CellAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/CellAlignment;->NONE:Lcom/vladsch/flexmark/util/html/CellAlignment;

    .line 5
    new-instance v1, Lcom/vladsch/flexmark/util/html/CellAlignment;

    const-string v3, "LEFT"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/html/CellAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/vladsch/flexmark/util/html/CellAlignment;->LEFT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    .line 6
    new-instance v3, Lcom/vladsch/flexmark/util/html/CellAlignment;

    const-string v5, "CENTER"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/vladsch/flexmark/util/html/CellAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/vladsch/flexmark/util/html/CellAlignment;->CENTER:Lcom/vladsch/flexmark/util/html/CellAlignment;

    .line 7
    new-instance v5, Lcom/vladsch/flexmark/util/html/CellAlignment;

    const-string v7, "RIGHT"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/vladsch/flexmark/util/html/CellAlignment;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/vladsch/flexmark/util/html/CellAlignment;->RIGHT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    const/4 v7, 0x4

    .line 3
    new-array v7, v7, [Lcom/vladsch/flexmark/util/html/CellAlignment;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lcom/vladsch/flexmark/util/html/CellAlignment;->$VALUES:[Lcom/vladsch/flexmark/util/html/CellAlignment;

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

.method public static getAlignment(Ljava/lang/String;)Lcom/vladsch/flexmark/util/html/CellAlignment;
    .locals 5

    .line 10
    invoke-static {}, Lcom/vladsch/flexmark/util/html/CellAlignment;->values()[Lcom/vladsch/flexmark/util/html/CellAlignment;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 11
    invoke-virtual {v3}, Lcom/vladsch/flexmark/util/html/CellAlignment;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 15
    :cond_1
    sget-object p0, Lcom/vladsch/flexmark/util/html/CellAlignment;->NONE:Lcom/vladsch/flexmark/util/html/CellAlignment;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vladsch/flexmark/util/html/CellAlignment;
    .locals 1

    .line 3
    const-class v0, Lcom/vladsch/flexmark/util/html/CellAlignment;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/util/html/CellAlignment;

    return-object p0
.end method

.method public static values()[Lcom/vladsch/flexmark/util/html/CellAlignment;
    .locals 1

    .line 3
    sget-object v0, Lcom/vladsch/flexmark/util/html/CellAlignment;->$VALUES:[Lcom/vladsch/flexmark/util/html/CellAlignment;

    invoke-virtual {v0}, [Lcom/vladsch/flexmark/util/html/CellAlignment;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vladsch/flexmark/util/html/CellAlignment;

    return-object v0
.end method
