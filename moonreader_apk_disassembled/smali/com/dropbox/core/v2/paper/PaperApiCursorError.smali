.class public final enum Lcom/dropbox/core/v2/paper/PaperApiCursorError;
.super Ljava/lang/Enum;
.source "PaperApiCursorError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/paper/PaperApiCursorError$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/paper/PaperApiCursorError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/paper/PaperApiCursorError;

.field public static final enum EXPIRED_CURSOR:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

.field public static final enum INVALID_CURSOR:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

.field public static final enum OTHER:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

.field public static final enum RESET:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

.field public static final enum WRONG_USER_IN_CURSOR:Lcom/dropbox/core/v2/paper/PaperApiCursorError;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 24
    new-instance v0, Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    const-string v1, "EXPIRED_CURSOR"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/paper/PaperApiCursorError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/paper/PaperApiCursorError;->EXPIRED_CURSOR:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    .line 28
    new-instance v1, Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    const-string v3, "INVALID_CURSOR"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/paper/PaperApiCursorError;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/paper/PaperApiCursorError;->INVALID_CURSOR:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    .line 32
    new-instance v3, Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    const-string v5, "WRONG_USER_IN_CURSOR"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/paper/PaperApiCursorError;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/paper/PaperApiCursorError;->WRONG_USER_IN_CURSOR:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    .line 37
    new-instance v5, Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    const-string v7, "RESET"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/paper/PaperApiCursorError;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/paper/PaperApiCursorError;->RESET:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    .line 45
    new-instance v7, Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    const-string v9, "OTHER"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/paper/PaperApiCursorError;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/paper/PaperApiCursorError;->OTHER:Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    const/4 v9, 0x5

    .line 19
    new-array v9, v9, [Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    sput-object v9, Lcom/dropbox/core/v2/paper/PaperApiCursorError;->$VALUES:[Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/paper/PaperApiCursorError;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/paper/PaperApiCursorError;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/paper/PaperApiCursorError;->$VALUES:[Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/paper/PaperApiCursorError;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/paper/PaperApiCursorError;

    return-object v0
.end method
