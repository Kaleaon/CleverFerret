.class public final enum Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;
.super Ljava/lang/Enum;
.source "LZXCoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/chmlib/LZXCoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "BlockType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

.field public static final enum alignOffset:Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

.field public static final enum uncompressed:Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

.field public static final enum undefined:Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

.field public static final enum verbatim:Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;
    .locals 3

    const/4 v0, 0x4

    .line 38
    new-array v0, v0, [Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    sget-object v1, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;->undefined:Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;->verbatim:Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;->alignOffset:Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;->uncompressed:Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 38
    new-instance v0, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    const-string v1, "undefined"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;->undefined:Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    new-instance v0, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    const-string v1, "verbatim"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;->verbatim:Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    new-instance v0, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    const-string v1, "alignOffset"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;->alignOffset:Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    new-instance v0, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    const-string v1, "uncompressed"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;->uncompressed:Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    invoke-static {}, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;->$values()[Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;->$VALUES:[Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

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

    .line 38
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 38
    const-class v0, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;
    .locals 1

    .line 38
    sget-object v0, Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;->$VALUES:[Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    invoke-virtual {v0}, [Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/books/chmlib/LZXCoder$BlockType;

    return-object v0
.end method
