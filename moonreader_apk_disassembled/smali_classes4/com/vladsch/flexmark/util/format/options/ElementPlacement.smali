.class public final enum Lcom/vladsch/flexmark/util/format/options/ElementPlacement;
.super Ljava/lang/Enum;
.source "ElementPlacement.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/vladsch/flexmark/util/format/options/ElementPlacement;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

.field public static final enum AS_IS:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

.field public static final enum DOCUMENT_BOTTOM:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

.field public static final enum DOCUMENT_TOP:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

.field public static final enum GROUP_WITH_FIRST:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

.field public static final enum GROUP_WITH_LAST:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    const-string v1, "AS_IS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->AS_IS:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    .line 5
    new-instance v1, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    const-string v3, "DOCUMENT_TOP"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->DOCUMENT_TOP:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    .line 6
    new-instance v3, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    const-string v5, "GROUP_WITH_FIRST"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->GROUP_WITH_FIRST:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    .line 7
    new-instance v5, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    const-string v7, "GROUP_WITH_LAST"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->GROUP_WITH_LAST:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    .line 8
    new-instance v7, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    const-string v9, "DOCUMENT_BOTTOM"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->DOCUMENT_BOTTOM:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    const/4 v9, 0x5

    .line 3
    new-array v9, v9, [Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    sput-object v9, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->$VALUES:[Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

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

.method public static valueOf(Ljava/lang/String;)Lcom/vladsch/flexmark/util/format/options/ElementPlacement;
    .locals 1

    .line 3
    const-class v0, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    return-object p0
.end method

.method public static values()[Lcom/vladsch/flexmark/util/format/options/ElementPlacement;
    .locals 1

    .line 3
    sget-object v0, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->$VALUES:[Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    invoke-virtual {v0}, [Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    return-object v0
.end method
