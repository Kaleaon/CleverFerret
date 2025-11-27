.class public final enum Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;
.super Ljava/lang/Enum;
.source "TableCell.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/ext/tables/TableCell;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Alignment"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

.field public static final enum CENTER:Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

.field public static final enum LEFT:Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

.field public static final enum RIGHT:Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 160
    new-instance v0, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    const-string v1, "LEFT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->LEFT:Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    new-instance v1, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    const-string v3, "CENTER"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->CENTER:Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    new-instance v3, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    const-string v5, "RIGHT"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->RIGHT:Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    const/4 v5, 0x3

    .line 159
    new-array v5, v5, [Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->$VALUES:[Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 159
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;
    .locals 1

    .line 159
    const-class v0, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    return-object p0
.end method

.method public static values()[Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;
    .locals 1

    .line 159
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->$VALUES:[Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    invoke-virtual {v0}, [Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    return-object v0
.end method


# virtual methods
.method public cellAlignment()Lcom/vladsch/flexmark/util/html/CellAlignment;
    .locals 2

    .line 163
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/TableCell$1;->$SwitchMap$com$vladsch$flexmark$ext$tables$TableCell$Alignment:[I

    invoke-virtual {p0}, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    .line 171
    sget-object v0, Lcom/vladsch/flexmark/util/html/CellAlignment;->NONE:Lcom/vladsch/flexmark/util/html/CellAlignment;

    return-object v0

    .line 169
    :cond_0
    sget-object v0, Lcom/vladsch/flexmark/util/html/CellAlignment;->RIGHT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    return-object v0

    .line 167
    :cond_1
    sget-object v0, Lcom/vladsch/flexmark/util/html/CellAlignment;->LEFT:Lcom/vladsch/flexmark/util/html/CellAlignment;

    return-object v0

    .line 165
    :cond_2
    sget-object v0, Lcom/vladsch/flexmark/util/html/CellAlignment;->CENTER:Lcom/vladsch/flexmark/util/html/CellAlignment;

    return-object v0
.end method
