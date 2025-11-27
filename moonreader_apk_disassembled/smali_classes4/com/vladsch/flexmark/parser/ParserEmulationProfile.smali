.class public final enum Lcom/vladsch/flexmark/parser/ParserEmulationProfile;
.super Ljava/lang/Enum;
.source "ParserEmulationProfile.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/options/MutableDataSetter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/vladsch/flexmark/parser/ParserEmulationProfile;",
        ">;",
        "Lcom/vladsch/flexmark/util/options/MutableDataSetter;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

.field public static final enum COMMONMARK:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

.field public static final enum COMMONMARK_0_26:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

.field public static final enum COMMONMARK_0_27:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

.field public static final enum COMMONMARK_0_28:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

.field public static final enum FIXED_INDENT:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

.field public static final enum GITHUB:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

.field public static final enum GITHUB_DOC:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

.field public static final enum KRAMDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

.field public static final enum MARKDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

.field public static final enum MULTI_MARKDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

.field public static final enum PEGDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

.field public static final PEGDOWN_EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum PEGDOWN_STRICT:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;


# instance fields
.field public final family:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;


# direct methods
.method static constructor <clinit>()V
    .locals 25

    .line 8
    new-instance v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    const-string v1, "COMMONMARK"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;-><init>(Ljava/lang/String;ILcom/vladsch/flexmark/parser/ParserEmulationProfile;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->COMMONMARK:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    .line 9
    new-instance v1, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    const-string v4, "COMMONMARK_0_26"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v0}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;-><init>(Ljava/lang/String;ILcom/vladsch/flexmark/parser/ParserEmulationProfile;)V

    sput-object v1, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->COMMONMARK_0_26:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    .line 10
    new-instance v4, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    const-string v6, "COMMONMARK_0_27"

    const/4 v7, 0x2

    invoke-direct {v4, v6, v7, v0}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;-><init>(Ljava/lang/String;ILcom/vladsch/flexmark/parser/ParserEmulationProfile;)V

    sput-object v4, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->COMMONMARK_0_27:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    .line 11
    new-instance v6, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    const-string v8, "COMMONMARK_0_28"

    const/4 v9, 0x3

    invoke-direct {v6, v8, v9, v0}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;-><init>(Ljava/lang/String;ILcom/vladsch/flexmark/parser/ParserEmulationProfile;)V

    sput-object v6, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->COMMONMARK_0_28:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    .line 12
    new-instance v8, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    const-string v10, "FIXED_INDENT"

    const/4 v11, 0x4

    invoke-direct {v8, v10, v11, v3}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;-><init>(Ljava/lang/String;ILcom/vladsch/flexmark/parser/ParserEmulationProfile;)V

    sput-object v8, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->FIXED_INDENT:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    .line 13
    new-instance v10, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    const-string v12, "KRAMDOWN"

    const/4 v13, 0x5

    invoke-direct {v10, v12, v13, v3}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;-><init>(Ljava/lang/String;ILcom/vladsch/flexmark/parser/ParserEmulationProfile;)V

    sput-object v10, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->KRAMDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    .line 14
    new-instance v12, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    const-string v14, "MARKDOWN"

    const/4 v15, 0x6

    invoke-direct {v12, v14, v15, v3}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;-><init>(Ljava/lang/String;ILcom/vladsch/flexmark/parser/ParserEmulationProfile;)V

    sput-object v12, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->MARKDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    .line 15
    new-instance v3, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    const-string v14, "GITHUB_DOC"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v3, v14, v2, v12}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;-><init>(Ljava/lang/String;ILcom/vladsch/flexmark/parser/ParserEmulationProfile;)V

    sput-object v3, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->GITHUB_DOC:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    .line 16
    new-instance v14, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    const/16 v17, 0x7

    const-string v2, "GITHUB"

    const/16 v18, 0x1

    const/16 v5, 0x8

    invoke-direct {v14, v2, v5, v0}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;-><init>(Ljava/lang/String;ILcom/vladsch/flexmark/parser/ParserEmulationProfile;)V

    sput-object v14, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->GITHUB:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    .line 17
    new-instance v2, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    const/16 v19, 0x8

    const-string v5, "MULTI_MARKDOWN"

    const/16 v20, 0x2

    const/16 v7, 0x9

    invoke-direct {v2, v5, v7, v8}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;-><init>(Ljava/lang/String;ILcom/vladsch/flexmark/parser/ParserEmulationProfile;)V

    sput-object v2, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->MULTI_MARKDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    .line 18
    new-instance v5, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    const/16 v21, 0x9

    const-string v7, "PEGDOWN"

    const/16 v22, 0x3

    const/16 v9, 0xa

    invoke-direct {v5, v7, v9, v8}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;-><init>(Ljava/lang/String;ILcom/vladsch/flexmark/parser/ParserEmulationProfile;)V

    sput-object v5, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->PEGDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    .line 19
    new-instance v7, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    const/16 v23, 0xa

    const-string v9, "PEGDOWN_STRICT"

    const/16 v24, 0x4

    const/16 v11, 0xb

    invoke-direct {v7, v9, v11, v8}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;-><init>(Ljava/lang/String;ILcom/vladsch/flexmark/parser/ParserEmulationProfile;)V

    sput-object v7, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->PEGDOWN_STRICT:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    const/16 v9, 0xc

    .line 7
    new-array v9, v9, [Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    aput-object v0, v9, v16

    aput-object v1, v9, v18

    aput-object v4, v9, v20

    aput-object v6, v9, v22

    aput-object v8, v9, v24

    aput-object v10, v9, v13

    aput-object v12, v9, v15

    aput-object v3, v9, v17

    aput-object v14, v9, v19

    aput-object v2, v9, v21

    aput-object v5, v9, v23

    aput-object v7, v9, v11

    sput-object v9, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->$VALUES:[Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    .line 40
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const v1, 0xffff

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "PEGDOWN_EXTENSIONS"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->PEGDOWN_EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILcom/vladsch/flexmark/parser/ParserEmulationProfile;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/parser/ParserEmulationProfile;",
            ")V"
        }
    .end annotation

    .line 23
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    if-nez p3, :cond_0

    move-object p3, p0

    .line 24
    :cond_0
    iput-object p3, p0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->family:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    return-void
.end method

.method public static haveAll(II)Z
    .locals 0

    and-int/2addr p0, p1

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static haveAny(II)Z
    .locals 0

    and-int/2addr p0, p1

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vladsch/flexmark/parser/ParserEmulationProfile;
    .locals 1

    .line 7
    const-class v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    return-object p0
.end method

.method public static values()[Lcom/vladsch/flexmark/parser/ParserEmulationProfile;
    .locals 1

    .line 7
    sget-object v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->$VALUES:[Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    invoke-virtual {v0}, [Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    return-object v0
.end method


# virtual methods
.method public getOptions()Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 1

    const/4 v0, 0x0

    .line 34
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->getOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object v0

    return-object v0
.end method

.method public getOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/MutableListOptions;
    .locals 7

    .line 43
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->family:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    sget-object v1, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->FIXED_INDENT:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    const v2, 0x7fffffff

    const/16 v3, 0x8

    const/4 v4, 0x4

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-ne v0, v1, :cond_3

    .line 44
    sget-object v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->MULTI_MARKDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne p0, v0, :cond_0

    .line 45
    new-instance p1, Lcom/vladsch/flexmark/parser/MutableListOptions;

    invoke-direct {p1}, Lcom/vladsch/flexmark/parser/MutableListOptions;-><init>()V

    invoke-virtual {p1, p0}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setParserEmulationFamily(Lcom/vladsch/flexmark/parser/ParserEmulationProfile;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 46
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setAutoLoose(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 47
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setAutoLooseOneLevelLists(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 48
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setDelimiterMismatchToNewList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 49
    invoke-virtual {p1, v3}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setCodeIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 50
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setEndOnDoubleBlank(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 51
    invoke-virtual {p1, v4}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    new-instance v0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    invoke-direct {v0}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;-><init>()V

    .line 53
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setBulletItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 54
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 55
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedNonOneItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 57
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyBulletItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 58
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 59
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedNonOneItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 61
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setBulletItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 62
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 63
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedNonOneItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 65
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyBulletItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 66
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 67
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedNonOneItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 69
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyBulletSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 70
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 71
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedNonOneSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 52
    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemInterrupt(Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 73
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemMarkerSpace(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 74
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemTypeMismatchToNewList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 75
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemTypeMismatchToSubList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 76
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenBlankLineFollowsItemParagraph(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 77
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenHasTrailingBlankLine(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 78
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenHasNonListChildren(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 79
    invoke-virtual {p1, v2}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setNewItemCodeIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 80
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setOrderedItemDotOnly(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 81
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setOrderedListManualStart(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    return-object p1

    .line 84
    :cond_0
    sget-object v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->PEGDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-eq p0, v0, :cond_2

    sget-object v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->PEGDOWN_STRICT:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne p0, v0, :cond_1

    goto/16 :goto_0

    .line 126
    :cond_1
    new-instance p1, Lcom/vladsch/flexmark/parser/MutableListOptions;

    invoke-direct {p1}, Lcom/vladsch/flexmark/parser/MutableListOptions;-><init>()V

    invoke-virtual {p1, p0}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setParserEmulationFamily(Lcom/vladsch/flexmark/parser/ParserEmulationProfile;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 127
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setAutoLoose(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 128
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setAutoLooseOneLevelLists(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 129
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenBlankLineFollowsItemParagraph(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 130
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenHasLooseSubItem(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 131
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenHasTrailingBlankLine(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 132
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenPrevHasTrailingBlankLine(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 133
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenLastItemPrevHasTrailingBlankLine(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 134
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setOrderedListManualStart(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 135
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setDelimiterMismatchToNewList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 136
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemTypeMismatchToNewList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 137
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemTypeMismatchToSubList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 138
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setEndOnDoubleBlank(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 139
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setOrderedItemDotOnly(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 140
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemMarkerSpace(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 141
    invoke-virtual {p1, v4}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 142
    invoke-virtual {p1, v3}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setCodeIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 143
    invoke-virtual {p1, v2}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setNewItemCodeIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    new-instance v0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    invoke-direct {v0}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;-><init>()V

    .line 145
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setBulletItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 146
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 147
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedNonOneItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 149
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyBulletItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 150
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 151
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedNonOneItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 153
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setBulletItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 154
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 155
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedNonOneItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 157
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyBulletItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 158
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 159
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedNonOneItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 161
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyBulletSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 162
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 163
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedNonOneSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 144
    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemInterrupt(Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    return-object p1

    .line 85
    :cond_2
    :goto_0
    sget-object v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->PEGDOWN_EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 87
    new-instance p1, Lcom/vladsch/flexmark/parser/MutableListOptions;

    invoke-direct {p1}, Lcom/vladsch/flexmark/parser/MutableListOptions;-><init>()V

    invoke-virtual {p1, p0}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setParserEmulationFamily(Lcom/vladsch/flexmark/parser/ParserEmulationProfile;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 88
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setAutoLoose(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 89
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setAutoLooseOneLevelLists(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 90
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenBlankLineFollowsItemParagraph(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 91
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenHasLooseSubItem(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 92
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenHasTrailingBlankLine(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 93
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenPrevHasTrailingBlankLine(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 94
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setOrderedListManualStart(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 95
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setDelimiterMismatchToNewList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 96
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemTypeMismatchToNewList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 97
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemTypeMismatchToSubList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 98
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setEndOnDoubleBlank(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 99
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setOrderedItemDotOnly(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 100
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemMarkerSpace(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 101
    invoke-virtual {p1, v4}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 102
    invoke-virtual {p1, v3}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setCodeIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 103
    invoke-virtual {p1, v2}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setNewItemCodeIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    new-instance v0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    invoke-direct {v0}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;-><init>()V

    .line 105
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setBulletItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 106
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 107
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedNonOneItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 109
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyBulletItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 110
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 111
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedNonOneItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 113
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setBulletItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 114
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 115
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedNonOneItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 117
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyBulletItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 118
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 119
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedNonOneItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 121
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyBulletSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 122
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 123
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedNonOneSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 104
    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemInterrupt(Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    return-object p1

    .line 166
    :cond_3
    sget-object p1, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->KRAMDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne v0, p1, :cond_4

    .line 167
    new-instance p1, Lcom/vladsch/flexmark/parser/MutableListOptions;

    invoke-direct {p1}, Lcom/vladsch/flexmark/parser/MutableListOptions;-><init>()V

    .line 168
    invoke-virtual {p1, p0}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setParserEmulationFamily(Lcom/vladsch/flexmark/parser/ParserEmulationProfile;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 169
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setAutoLoose(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 170
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenBlankLineFollowsItemParagraph(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 171
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenHasLooseSubItem(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 172
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenHasTrailingBlankLine(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 173
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenPrevHasTrailingBlankLine(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 174
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setOrderedListManualStart(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 175
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setDelimiterMismatchToNewList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 176
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemTypeMismatchToNewList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 177
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemTypeMismatchToSubList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 178
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setOrderedItemDotOnly(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 179
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemMarkerSpace(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 180
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setEndOnDoubleBlank(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 181
    invoke-virtual {p1, v4}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 182
    invoke-virtual {p1, v3}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setCodeIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 183
    invoke-virtual {p1, v2}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setNewItemCodeIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    new-instance v0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    invoke-direct {v0}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;-><init>()V

    .line 185
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setBulletItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 186
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 187
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedNonOneItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 189
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyBulletItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 190
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 191
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedNonOneItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 193
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setBulletItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 194
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 195
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedNonOneItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 197
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyBulletItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 198
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 199
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedNonOneItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 201
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyBulletSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 202
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 203
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedNonOneSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 184
    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemInterrupt(Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    return-object p1

    .line 206
    :cond_4
    sget-object p1, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->MARKDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne v0, p1, :cond_6

    .line 207
    sget-object p1, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->GITHUB_DOC:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne p0, p1, :cond_5

    .line 208
    new-instance p1, Lcom/vladsch/flexmark/parser/MutableListOptions;

    invoke-direct {p1}, Lcom/vladsch/flexmark/parser/MutableListOptions;-><init>()V

    .line 209
    invoke-virtual {p1, p0}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setParserEmulationFamily(Lcom/vladsch/flexmark/parser/ParserEmulationProfile;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 210
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setAutoLoose(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 211
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenBlankLineFollowsItemParagraph(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 212
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenHasLooseSubItem(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 213
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenHasTrailingBlankLine(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 214
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenPrevHasTrailingBlankLine(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 215
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenContainsBlankLine(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 216
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenHasNonListChildren(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 217
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setOrderedListManualStart(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 218
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setDelimiterMismatchToNewList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 219
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemTypeMismatchToNewList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 220
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemTypeMismatchToSubList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 221
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setEndOnDoubleBlank(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 222
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setOrderedItemDotOnly(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 223
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemMarkerSpace(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 224
    invoke-virtual {p1, v4}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 225
    invoke-virtual {p1, v3}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setCodeIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 226
    invoke-virtual {p1, v2}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setNewItemCodeIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    new-instance v0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    invoke-direct {v0}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;-><init>()V

    .line 228
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setBulletItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 229
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 230
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedNonOneItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 232
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyBulletItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 233
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 234
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedNonOneItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 236
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setBulletItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 237
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 238
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedNonOneItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 240
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyBulletItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 241
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 242
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedNonOneItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 244
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyBulletSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 245
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 246
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedNonOneSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 227
    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemInterrupt(Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    return-object p1

    .line 249
    :cond_5
    new-instance p1, Lcom/vladsch/flexmark/parser/MutableListOptions;

    invoke-direct {p1}, Lcom/vladsch/flexmark/parser/MutableListOptions;-><init>()V

    .line 250
    invoke-virtual {p1, p0}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setParserEmulationFamily(Lcom/vladsch/flexmark/parser/ParserEmulationProfile;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 251
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setAutoLoose(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 252
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenBlankLineFollowsItemParagraph(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 253
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenHasLooseSubItem(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 254
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenHasTrailingBlankLine(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 255
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenPrevHasTrailingBlankLine(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 256
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setLooseWhenContainsBlankLine(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 257
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setOrderedListManualStart(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 258
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setDelimiterMismatchToNewList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 259
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemTypeMismatchToNewList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 260
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemTypeMismatchToSubList(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 261
    invoke-virtual {p1, v6}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setEndOnDoubleBlank(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 262
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setOrderedItemDotOnly(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 263
    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemMarkerSpace(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 264
    invoke-virtual {p1, v4}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 265
    invoke-virtual {p1, v3}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setCodeIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    .line 266
    invoke-virtual {p1, v2}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setNewItemCodeIndent(I)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    new-instance v0, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    invoke-direct {v0}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;-><init>()V

    .line 268
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setBulletItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 269
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 270
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedNonOneItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 272
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyBulletItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 273
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 274
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedNonOneItemInterruptsParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 276
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setBulletItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 277
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 278
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setOrderedNonOneItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 280
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyBulletItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 281
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 282
    invoke-virtual {v0, v6}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedNonOneItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 284
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyBulletSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 285
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 286
    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;->setEmptyOrderedNonOneSubItemInterruptsItemParagraph(Z)Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;

    move-result-object v0

    .line 267
    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setItemInterrupt(Lcom/vladsch/flexmark/parser/ListOptions$MutableItemInterrupt;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    return-object p1

    .line 290
    :cond_6
    sget-object p1, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->COMMONMARK:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    const/4 v1, 0x0

    if-ne v0, p1, :cond_7

    .line 291
    sget-object p1, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->COMMONMARK_0_26:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne p0, p1, :cond_7

    .line 292
    new-instance p1, Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-object v0, v1

    check-cast v0, Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-direct {p1, v1}, Lcom/vladsch/flexmark/parser/MutableListOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    invoke-virtual {p1, v5}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setEndOnDoubleBlank(Z)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object p1

    return-object p1

    .line 297
    :cond_7
    new-instance p1, Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-object v0, v1

    check-cast v0, Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-direct {p1, v1}, Lcom/vladsch/flexmark/parser/MutableListOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-object p1
.end method

.method public getProfileOptions()Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 1

    .line 28
    new-instance v0, Lcom/vladsch/flexmark/util/options/MutableDataSet;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/options/MutableDataSet;-><init>()V

    .line 29
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    return-object v0
.end method

.method public setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 7

    .line 302
    sget-object v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->FIXED_INDENT:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    const/4 v1, 0x0

    .line 305
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x1

    .line 304
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    if-ne p0, v0, :cond_0

    .line 303
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->getOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->STRONG_WRAPS_EMPHASIS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 304
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->LINKS_ALLOW_MATCHED_PARENTHESES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 305
    invoke-interface {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    return-object p1

    .line 307
    :cond_0
    sget-object v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->KRAMDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    const-string v3, " "

    if-ne p0, v0, :cond_1

    .line 308
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->getOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 309
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HEADING_NO_LEAD_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 310
    invoke-interface {p1, v0, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v4, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 311
    invoke-interface {v0, v4, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v4, Lcom/vladsch/flexmark/html/HtmlRenderer;->RENDER_HEADER_ID:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 312
    invoke-interface {v0, v4, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v4, Lcom/vladsch/flexmark/html/HtmlRenderer;->SOFT_BREAK:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 313
    invoke-interface {v0, v4, v3}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 316
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_NON_BLOCK:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 317
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_FIRST_OPEN_TAG_ON_ONE_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 318
    invoke-interface {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 319
    invoke-interface {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_MARKDOWN_INTERRUPTS_CLOSED:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 320
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS_PARTIAL_TAG:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 321
    invoke-interface {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_INDENTED_CODE_INTERRUPTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 322
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->STRONG_WRAPS_EMPHASIS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 323
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->LINKS_ALLOW_MATCHED_PARENTHESES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 324
    invoke-interface {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    return-object p1

    .line 326
    :cond_1
    sget-object v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->MARKDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne p0, v0, :cond_2

    .line 327
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->getOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 328
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HEADING_NO_LEAD_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 329
    invoke-interface {p1, v0, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v4, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_IGNORE_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 330
    invoke-interface {v0, v4, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v4, Lcom/vladsch/flexmark/html/HtmlRenderer;->SOFT_BREAK:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 331
    invoke-interface {v0, v4, v3}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 334
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_NON_BLOCK:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 335
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_FIRST_OPEN_TAG_ON_ONE_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 336
    invoke-interface {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 337
    invoke-interface {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_MARKDOWN_INTERRUPTS_CLOSED:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 338
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS_PARTIAL_TAG:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 339
    invoke-interface {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_INDENTED_CODE_INTERRUPTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 340
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->STRONG_WRAPS_EMPHASIS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 341
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->LINKS_ALLOW_MATCHED_PARENTHESES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 342
    invoke-interface {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    return-object p1

    .line 344
    :cond_2
    sget-object v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->GITHUB_DOC:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    const-string v4, "_"

    const-string v5, " -"

    if-ne p0, v0, :cond_3

    .line 345
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->getOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 346
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_IGNORE_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 347
    invoke-interface {p1, v0, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_INTERRUPTS_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 348
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 349
    invoke-interface {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HEADING_NO_LEAD_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 350
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 353
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_NON_BLOCK:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 354
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_FIRST_OPEN_TAG_ON_ONE_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 355
    invoke-interface {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 356
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_MARKDOWN_INTERRUPTS_CLOSED:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 357
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS_PARTIAL_TAG:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 358
    invoke-interface {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_INDENTED_CODE_INTERRUPTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 359
    invoke-interface {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->STRONG_WRAPS_EMPHASIS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 360
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->LINKS_ALLOW_MATCHED_PARENTHESES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 361
    invoke-interface {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v2, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_TO_DASH_CHARS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 364
    invoke-interface {v0, v2, v5}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v2, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_NON_DASH_CHARS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 365
    invoke-interface {v0, v2, v4}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v2, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_NON_ASCII_TO_LOWERCASE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 366
    invoke-interface {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    return-object p1

    .line 368
    :cond_3
    sget-object v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->GITHUB:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne p0, v0, :cond_4

    .line 369
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->getOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 370
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_TO_DASH_CHARS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 372
    invoke-interface {p1, v0, v5}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v2, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_NON_DASH_CHARS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 373
    invoke-interface {v0, v2, v4}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v2, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_NON_ASCII_TO_LOWERCASE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 374
    invoke-interface {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    return-object p1

    .line 376
    :cond_4
    sget-object v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->MULTI_MARKDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne p0, v0, :cond_5

    .line 377
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->getOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 378
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_IGNORE_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 379
    invoke-interface {p1, v0, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v4, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_WITH_LEAD_SPACES_INTERRUPTS_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 380
    invoke-interface {v0, v4, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v4, Lcom/vladsch/flexmark/html/HtmlRenderer;->RENDER_HEADER_ID:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 381
    invoke-interface {v0, v4, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v4, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_RESOLVE_DUPES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 382
    invoke-interface {v0, v4, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v4, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_TO_DASH_CHARS:Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v5, ""

    .line 383
    invoke-interface {v0, v4, v5}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v4, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_NO_DUPED_DASHES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 384
    invoke-interface {v0, v4, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v4, Lcom/vladsch/flexmark/html/HtmlRenderer;->SOFT_BREAK:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 385
    invoke-interface {v0, v4, v3}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 388
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_NON_BLOCK:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 389
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_FIRST_OPEN_TAG_ON_ONE_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 390
    invoke-interface {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 391
    invoke-interface {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_MARKDOWN_INTERRUPTS_CLOSED:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 392
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS_PARTIAL_TAG:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 393
    invoke-interface {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_INDENTED_CODE_INTERRUPTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 394
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->STRONG_WRAPS_EMPHASIS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 395
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->LINKS_ALLOW_MATCHED_PARENTHESES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 396
    invoke-interface {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    return-object p1

    .line 398
    :cond_5
    sget-object v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->PEGDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-eq p0, v0, :cond_9

    sget-object v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->PEGDOWN_STRICT:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne p0, v0, :cond_6

    goto :goto_1

    .line 449
    :cond_6
    sget-object v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->COMMONMARK_0_26:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-eq p0, v0, :cond_8

    sget-object v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->COMMONMARK_0_27:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne p0, v0, :cond_7

    goto :goto_0

    :cond_7
    return-object p1

    .line 451
    :cond_8
    :goto_0
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->STRONG_WRAPS_EMPHASIS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 452
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->LINKS_ALLOW_MATCHED_PARENTHESES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    return-object p1

    .line 399
    :cond_9
    :goto_1
    sget-object v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->PEGDOWN_EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 401
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->getOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/MutableListOptions;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/vladsch/flexmark/parser/MutableListOptions;->setIn(Lcom/vladsch/flexmark/util/options/MutableDataHolder;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 402
    sget-object v4, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_EXTEND_TO_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 403
    invoke-interface {p1, v4, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v4

    sget-object v5, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_IGNORE_BLANK_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 404
    invoke-interface {v4, v5, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v4

    sget-object v5, Lcom/vladsch/flexmark/parser/Parser;->BLOCK_QUOTE_ALLOW_LEADING_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 405
    invoke-interface {v4, v5, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v4

    sget-object v5, Lcom/vladsch/flexmark/parser/Parser;->INDENTED_CODE_NO_TRAILING_BLANK_LINES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 406
    invoke-interface {v4, v5, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v4

    sget-object v5, Lcom/vladsch/flexmark/parser/Parser;->HEADING_SETEXT_MARKER_LENGTH:Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v6, 0x3

    .line 407
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v4

    sget-object v5, Lcom/vladsch/flexmark/parser/Parser;->HEADING_NO_LEAD_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 408
    invoke-interface {v4, v5, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v4

    sget-object v5, Lcom/vladsch/flexmark/parser/Parser;->REFERENCES_KEEP:Lcom/vladsch/flexmark/util/options/DataKey;

    sget-object v6, Lcom/vladsch/flexmark/util/KeepType;->LAST:Lcom/vladsch/flexmark/util/KeepType;

    .line 409
    invoke-interface {v4, v5, v6}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v4

    sget-object v5, Lcom/vladsch/flexmark/parser/Parser;->PARSE_INNER_HTML_COMMENTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 410
    invoke-interface {v4, v5, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v4

    sget-object v5, Lcom/vladsch/flexmark/parser/Parser;->SPACE_IN_LINK_ELEMENTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 411
    invoke-interface {v4, v5, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v4

    sget-object v5, Lcom/vladsch/flexmark/html/HtmlRenderer;->OBFUSCATE_EMAIL:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 413
    invoke-interface {v4, v5, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v4

    sget-object v5, Lcom/vladsch/flexmark/html/HtmlRenderer;->GENERATE_HEADER_ID:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 414
    invoke-interface {v4, v5, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v4

    sget-object v5, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_NO_DUPED_DASHES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 416
    invoke-interface {v4, v5, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v4

    sget-object v5, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_RESOLVE_DUPES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 417
    invoke-interface {v4, v5, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v4

    sget-object v5, Lcom/vladsch/flexmark/html/HtmlRenderer;->SOFT_BREAK:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 418
    invoke-interface {v4, v5, v3}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v3

    sget-object v4, Lcom/vladsch/flexmark/parser/Parser;->STRONG_WRAPS_EMPHASIS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 419
    invoke-interface {v3, v4, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v3

    sget-object v4, Lcom/vladsch/flexmark/parser/Parser;->LINKS_ALLOW_MATCHED_PARENTHESES:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 420
    invoke-interface {v3, v4, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    const/16 v3, 0x400

    .line 423
    invoke-static {v0, v3}, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->haveAny(II)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 424
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->RENDER_HEADER_ID:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    .line 427
    :cond_a
    sget-object v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->PEGDOWN_STRICT:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne p0, v0, :cond_b

    .line 429
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 430
    invoke-interface {p1, v0, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_NON_BLOCK:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 431
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_FIRST_OPEN_TAG_ON_ONE_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 432
    invoke-interface {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 433
    invoke-interface {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_MARKDOWN_INTERRUPTS_CLOSED:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 434
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS_PARTIAL_TAG:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 435
    invoke-interface {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_INDENTED_CODE_INTERRUPTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 436
    invoke-interface {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    return-object p1

    .line 439
    :cond_b
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSER:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 440
    invoke-interface {p1, v0, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_NON_BLOCK:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 441
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_FIRST_OPEN_TAG_ON_ONE_LINE:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 442
    invoke-interface {v0, v3, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 443
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v3, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_MARKDOWN_INTERRUPTS_CLOSED:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 444
    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_BLANK_LINE_INTERRUPTS_PARTIAL_TAG:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 445
    invoke-interface {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->HTML_BLOCK_DEEP_PARSE_INDENTED_CODE_INTERRUPTS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 446
    invoke-interface {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/MutableDataHolder;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    return-object p1
.end method
