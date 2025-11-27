.class public final enum Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;
.super Ljava/lang/Enum;
.source "LookupError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/fileproperties/LookupError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

.field public static final enum MALFORMED_PATH:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

.field public static final enum NOT_FILE:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

.field public static final enum NOT_FOLDER:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

.field public static final enum NOT_FOUND:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

.field public static final enum OTHER:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

.field public static final enum RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 36
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    const-string v1, "MALFORMED_PATH"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->MALFORMED_PATH:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    .line 40
    new-instance v1, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    const-string v3, "NOT_FOUND"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->NOT_FOUND:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    .line 45
    new-instance v3, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    const-string v5, "NOT_FILE"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->NOT_FILE:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    .line 50
    new-instance v5, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    const-string v7, "NOT_FOLDER"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->NOT_FOLDER:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    .line 55
    new-instance v7, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    const-string v9, "RESTRICTED_CONTENT"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    .line 64
    new-instance v9, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    const-string v11, "OTHER"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->OTHER:Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    const/4 v11, 0x6

    .line 35
    new-array v11, v11, [Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    aput-object v0, v11, v2

    aput-object v1, v11, v4

    aput-object v3, v11, v6

    aput-object v5, v11, v8

    aput-object v7, v11, v10

    aput-object v9, v11, v12

    sput-object v11, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->$VALUES:[Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 35
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;
    .locals 1

    .line 35
    const-class v0, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;
    .locals 1

    .line 35
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->$VALUES:[Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/fileproperties/LookupError$Tag;

    return-object v0
.end method
