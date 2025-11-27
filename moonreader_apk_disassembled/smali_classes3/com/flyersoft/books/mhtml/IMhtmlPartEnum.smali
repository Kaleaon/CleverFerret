.class public final enum Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;
.super Ljava/lang/Enum;
.source "IMhtmlPartEnum.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

.field public static final enum CSS:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

.field public static final enum GIF:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

.field public static final enum HTML:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

.field public static final enum JPEG:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

.field public static final enum PNG:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;


# instance fields
.field private describe:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;
    .locals 3

    const/4 v0, 0x5

    .line 10
    new-array v0, v0, [Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    sget-object v1, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->HTML:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->CSS:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->PNG:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->JPEG:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->GIF:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 12
    new-instance v0, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    const/4 v1, 0x0

    const-string v2, "html\u7684\u5185\u5bb9"

    const-string v3, "HTML"

    invoke-direct {v0, v3, v1, v2}, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->HTML:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    .line 13
    new-instance v0, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    const/4 v1, 0x1

    const-string v2, "css\u7684\u5185\u5bb9"

    const-string v3, "CSS"

    invoke-direct {v0, v3, v1, v2}, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->CSS:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    .line 14
    new-instance v0, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    const/4 v1, 0x2

    const-string v2, "png\u7684\u56fe\u7247"

    const-string v3, "PNG"

    invoke-direct {v0, v3, v1, v2}, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->PNG:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    .line 15
    new-instance v0, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    const/4 v1, 0x3

    const-string v2, "jpeg\u7684\u5185\u5bb9"

    const-string v3, "JPEG"

    invoke-direct {v0, v3, v1, v2}, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->JPEG:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    .line 16
    new-instance v0, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    const/4 v1, 0x4

    const-string v2, "GIF\u7684\u5185\u5bb9"

    const-string v3, "GIF"

    invoke-direct {v0, v3, v1, v2}, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->GIF:Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    .line 10
    invoke-static {}, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->$values()[Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->$VALUES:[Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x0
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 23
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 24
    iput-object p3, p0, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->describe:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 10
    const-class v0, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;
    .locals 1

    .line 10
    sget-object v0, Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->$VALUES:[Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    invoke-virtual {v0}, [Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/books/mhtml/IMhtmlPartEnum;

    return-object v0
.end method
