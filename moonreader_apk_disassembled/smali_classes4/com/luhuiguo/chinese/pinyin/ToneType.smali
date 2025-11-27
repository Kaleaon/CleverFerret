.class public final enum Lcom/luhuiguo/chinese/pinyin/ToneType;
.super Ljava/lang/Enum;
.source "ToneType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/luhuiguo/chinese/pinyin/ToneType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/luhuiguo/chinese/pinyin/ToneType;

.field public static final enum WITHOUT_TONE:Lcom/luhuiguo/chinese/pinyin/ToneType;

.field public static final enum WITH_ABBR:Lcom/luhuiguo/chinese/pinyin/ToneType;

.field public static final enum WITH_TONE_MARK:Lcom/luhuiguo/chinese/pinyin/ToneType;

.field public static final enum WITH_TONE_NUMBER:Lcom/luhuiguo/chinese/pinyin/ToneType;


# direct methods
.method private static synthetic $values()[Lcom/luhuiguo/chinese/pinyin/ToneType;
    .locals 3

    const/4 v0, 0x4

    .line 41
    new-array v0, v0, [Lcom/luhuiguo/chinese/pinyin/ToneType;

    sget-object v1, Lcom/luhuiguo/chinese/pinyin/ToneType;->WITH_TONE_NUMBER:Lcom/luhuiguo/chinese/pinyin/ToneType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/luhuiguo/chinese/pinyin/ToneType;->WITHOUT_TONE:Lcom/luhuiguo/chinese/pinyin/ToneType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/luhuiguo/chinese/pinyin/ToneType;->WITH_TONE_MARK:Lcom/luhuiguo/chinese/pinyin/ToneType;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/luhuiguo/chinese/pinyin/ToneType;->WITH_ABBR:Lcom/luhuiguo/chinese/pinyin/ToneType;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 46
    new-instance v0, Lcom/luhuiguo/chinese/pinyin/ToneType;

    const-string v1, "WITH_TONE_NUMBER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/luhuiguo/chinese/pinyin/ToneType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/luhuiguo/chinese/pinyin/ToneType;->WITH_TONE_NUMBER:Lcom/luhuiguo/chinese/pinyin/ToneType;

    .line 51
    new-instance v0, Lcom/luhuiguo/chinese/pinyin/ToneType;

    const-string v1, "WITHOUT_TONE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/luhuiguo/chinese/pinyin/ToneType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/luhuiguo/chinese/pinyin/ToneType;->WITHOUT_TONE:Lcom/luhuiguo/chinese/pinyin/ToneType;

    .line 56
    new-instance v0, Lcom/luhuiguo/chinese/pinyin/ToneType;

    const-string v1, "WITH_TONE_MARK"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/luhuiguo/chinese/pinyin/ToneType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/luhuiguo/chinese/pinyin/ToneType;->WITH_TONE_MARK:Lcom/luhuiguo/chinese/pinyin/ToneType;

    .line 61
    new-instance v0, Lcom/luhuiguo/chinese/pinyin/ToneType;

    const-string v1, "WITH_ABBR"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/luhuiguo/chinese/pinyin/ToneType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/luhuiguo/chinese/pinyin/ToneType;->WITH_ABBR:Lcom/luhuiguo/chinese/pinyin/ToneType;

    .line 41
    invoke-static {}, Lcom/luhuiguo/chinese/pinyin/ToneType;->$values()[Lcom/luhuiguo/chinese/pinyin/ToneType;

    move-result-object v0

    sput-object v0, Lcom/luhuiguo/chinese/pinyin/ToneType;->$VALUES:[Lcom/luhuiguo/chinese/pinyin/ToneType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 41
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/luhuiguo/chinese/pinyin/ToneType;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 41
    const-class v0, Lcom/luhuiguo/chinese/pinyin/ToneType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/luhuiguo/chinese/pinyin/ToneType;

    return-object p0
.end method

.method public static values()[Lcom/luhuiguo/chinese/pinyin/ToneType;
    .locals 1

    .line 41
    sget-object v0, Lcom/luhuiguo/chinese/pinyin/ToneType;->$VALUES:[Lcom/luhuiguo/chinese/pinyin/ToneType;

    invoke-virtual {v0}, [Lcom/luhuiguo/chinese/pinyin/ToneType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/luhuiguo/chinese/pinyin/ToneType;

    return-object v0
.end method
