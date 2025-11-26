.class public final enum Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;
.super Ljava/lang/Enum;
.source "InvalidPropertyGroupError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

.field public static final enum DOES_NOT_FIT_TEMPLATE:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

.field public static final enum DUPLICATE_PROPERTY_GROUPS:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

.field public static final enum OTHER:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

.field public static final enum PATH:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

.field public static final enum PROPERTY_FIELD_TOO_LARGE:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

.field public static final enum RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

.field public static final enum TEMPLATE_NOT_FOUND:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

.field public static final enum UNSUPPORTED_FOLDER:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;


# direct methods
.method static constructor <clinit>()V
    .locals 17

    .line 36
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    const-string v1, "TEMPLATE_NOT_FOUND"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;->TEMPLATE_NOT_FOUND:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    .line 40
    new-instance v1, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    const-string v3, "RESTRICTED_CONTENT"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;->RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    .line 49
    new-instance v3, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    const-string v5, "OTHER"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;->OTHER:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    .line 50
    new-instance v5, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    const-string v7, "PATH"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;->PATH:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    .line 55
    new-instance v7, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    const-string v9, "UNSUPPORTED_FOLDER"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;->UNSUPPORTED_FOLDER:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    .line 59
    new-instance v9, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    const-string v11, "PROPERTY_FIELD_TOO_LARGE"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;->PROPERTY_FIELD_TOO_LARGE:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    .line 64
    new-instance v11, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    const-string v13, "DOES_NOT_FIT_TEMPLATE"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;->DOES_NOT_FIT_TEMPLATE:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    .line 69
    new-instance v13, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    const-string v15, "DUPLICATE_PROPERTY_GROUPS"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;->DUPLICATE_PROPERTY_GROUPS:Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    const/16 v15, 0x8

    .line 32
    new-array v15, v15, [Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    aput-object v0, v15, v16

    aput-object v1, v15, v4

    aput-object v3, v15, v6

    aput-object v5, v15, v8

    aput-object v7, v15, v10

    aput-object v9, v15, v12

    aput-object v11, v15, v14

    aput-object v13, v15, v2

    sput-object v15, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;->$VALUES:[Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 32
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;
    .locals 1

    .line 32
    const-class v0, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;
    .locals 1

    .line 32
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;->$VALUES:[Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/fileproperties/InvalidPropertyGroupError$Tag;

    return-object v0
.end method
