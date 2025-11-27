.class public final enum Lcom/dropbox/core/v2/files/WriteConflictError;
.super Ljava/lang/Enum;
.source "WriteConflictError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/WriteConflictError$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/files/WriteConflictError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/files/WriteConflictError;

.field public static final enum FILE:Lcom/dropbox/core/v2/files/WriteConflictError;

.field public static final enum FILE_ANCESTOR:Lcom/dropbox/core/v2/files/WriteConflictError;

.field public static final enum FOLDER:Lcom/dropbox/core/v2/files/WriteConflictError;

.field public static final enum OTHER:Lcom/dropbox/core/v2/files/WriteConflictError;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 24
    new-instance v0, Lcom/dropbox/core/v2/files/WriteConflictError;

    const-string v1, "FILE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/files/WriteConflictError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/files/WriteConflictError;->FILE:Lcom/dropbox/core/v2/files/WriteConflictError;

    .line 28
    new-instance v1, Lcom/dropbox/core/v2/files/WriteConflictError;

    const-string v3, "FOLDER"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/files/WriteConflictError;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/files/WriteConflictError;->FOLDER:Lcom/dropbox/core/v2/files/WriteConflictError;

    .line 33
    new-instance v3, Lcom/dropbox/core/v2/files/WriteConflictError;

    const-string v5, "FILE_ANCESTOR"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/files/WriteConflictError;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/files/WriteConflictError;->FILE_ANCESTOR:Lcom/dropbox/core/v2/files/WriteConflictError;

    .line 41
    new-instance v5, Lcom/dropbox/core/v2/files/WriteConflictError;

    const-string v7, "OTHER"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/files/WriteConflictError;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/files/WriteConflictError;->OTHER:Lcom/dropbox/core/v2/files/WriteConflictError;

    const/4 v7, 0x4

    .line 19
    new-array v7, v7, [Lcom/dropbox/core/v2/files/WriteConflictError;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lcom/dropbox/core/v2/files/WriteConflictError;->$VALUES:[Lcom/dropbox/core/v2/files/WriteConflictError;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/files/WriteConflictError;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/files/WriteConflictError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/files/WriteConflictError;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/files/WriteConflictError;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/files/WriteConflictError;->$VALUES:[Lcom/dropbox/core/v2/files/WriteConflictError;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/files/WriteConflictError;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/files/WriteConflictError;

    return-object v0
.end method
