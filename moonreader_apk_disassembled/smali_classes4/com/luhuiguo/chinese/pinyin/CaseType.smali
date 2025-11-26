.class public final enum Lcom/luhuiguo/chinese/pinyin/CaseType;
.super Ljava/lang/Enum;
.source "CaseType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/luhuiguo/chinese/pinyin/CaseType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/luhuiguo/chinese/pinyin/CaseType;

.field public static final enum CAPITALIZE:Lcom/luhuiguo/chinese/pinyin/CaseType;

.field public static final enum LOWERCASE:Lcom/luhuiguo/chinese/pinyin/CaseType;

.field public static final enum UPPERCASE:Lcom/luhuiguo/chinese/pinyin/CaseType;


# direct methods
.method private static synthetic $values()[Lcom/luhuiguo/chinese/pinyin/CaseType;
    .locals 3

    const/4 v0, 0x3

    .line 36
    new-array v0, v0, [Lcom/luhuiguo/chinese/pinyin/CaseType;

    sget-object v1, Lcom/luhuiguo/chinese/pinyin/CaseType;->LOWERCASE:Lcom/luhuiguo/chinese/pinyin/CaseType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/luhuiguo/chinese/pinyin/CaseType;->UPPERCASE:Lcom/luhuiguo/chinese/pinyin/CaseType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/luhuiguo/chinese/pinyin/CaseType;->CAPITALIZE:Lcom/luhuiguo/chinese/pinyin/CaseType;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 41
    new-instance v0, Lcom/luhuiguo/chinese/pinyin/CaseType;

    const-string v1, "LOWERCASE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/luhuiguo/chinese/pinyin/CaseType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/luhuiguo/chinese/pinyin/CaseType;->LOWERCASE:Lcom/luhuiguo/chinese/pinyin/CaseType;

    .line 46
    new-instance v0, Lcom/luhuiguo/chinese/pinyin/CaseType;

    const-string v1, "UPPERCASE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/luhuiguo/chinese/pinyin/CaseType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/luhuiguo/chinese/pinyin/CaseType;->UPPERCASE:Lcom/luhuiguo/chinese/pinyin/CaseType;

    .line 51
    new-instance v0, Lcom/luhuiguo/chinese/pinyin/CaseType;

    const-string v1, "CAPITALIZE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/luhuiguo/chinese/pinyin/CaseType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/luhuiguo/chinese/pinyin/CaseType;->CAPITALIZE:Lcom/luhuiguo/chinese/pinyin/CaseType;

    .line 36
    invoke-static {}, Lcom/luhuiguo/chinese/pinyin/CaseType;->$values()[Lcom/luhuiguo/chinese/pinyin/CaseType;

    move-result-object v0

    sput-object v0, Lcom/luhuiguo/chinese/pinyin/CaseType;->$VALUES:[Lcom/luhuiguo/chinese/pinyin/CaseType;

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

    .line 36
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/luhuiguo/chinese/pinyin/CaseType;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 36
    const-class v0, Lcom/luhuiguo/chinese/pinyin/CaseType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/luhuiguo/chinese/pinyin/CaseType;

    return-object p0
.end method

.method public static values()[Lcom/luhuiguo/chinese/pinyin/CaseType;
    .locals 1

    .line 36
    sget-object v0, Lcom/luhuiguo/chinese/pinyin/CaseType;->$VALUES:[Lcom/luhuiguo/chinese/pinyin/CaseType;

    invoke-virtual {v0}, [Lcom/luhuiguo/chinese/pinyin/CaseType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/luhuiguo/chinese/pinyin/CaseType;

    return-object v0
.end method
