.class public final enum Lcom/dropbox/core/v2/paper/ImportFormat;
.super Ljava/lang/Enum;
.source "ImportFormat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/paper/ImportFormat$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/paper/ImportFormat;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/paper/ImportFormat;

.field public static final enum HTML:Lcom/dropbox/core/v2/paper/ImportFormat;

.field public static final enum MARKDOWN:Lcom/dropbox/core/v2/paper/ImportFormat;

.field public static final enum OTHER:Lcom/dropbox/core/v2/paper/ImportFormat;

.field public static final enum PLAIN_TEXT:Lcom/dropbox/core/v2/paper/ImportFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 27
    new-instance v0, Lcom/dropbox/core/v2/paper/ImportFormat;

    const-string v1, "HTML"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/paper/ImportFormat;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/paper/ImportFormat;->HTML:Lcom/dropbox/core/v2/paper/ImportFormat;

    .line 32
    new-instance v1, Lcom/dropbox/core/v2/paper/ImportFormat;

    const-string v3, "MARKDOWN"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/paper/ImportFormat;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/paper/ImportFormat;->MARKDOWN:Lcom/dropbox/core/v2/paper/ImportFormat;

    .line 37
    new-instance v3, Lcom/dropbox/core/v2/paper/ImportFormat;

    const-string v5, "PLAIN_TEXT"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/paper/ImportFormat;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/paper/ImportFormat;->PLAIN_TEXT:Lcom/dropbox/core/v2/paper/ImportFormat;

    .line 45
    new-instance v5, Lcom/dropbox/core/v2/paper/ImportFormat;

    const-string v7, "OTHER"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/paper/ImportFormat;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/paper/ImportFormat;->OTHER:Lcom/dropbox/core/v2/paper/ImportFormat;

    const/4 v7, 0x4

    .line 22
    new-array v7, v7, [Lcom/dropbox/core/v2/paper/ImportFormat;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lcom/dropbox/core/v2/paper/ImportFormat;->$VALUES:[Lcom/dropbox/core/v2/paper/ImportFormat;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/paper/ImportFormat;
    .locals 1

    .line 22
    const-class v0, Lcom/dropbox/core/v2/paper/ImportFormat;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/paper/ImportFormat;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/paper/ImportFormat;
    .locals 1

    .line 22
    sget-object v0, Lcom/dropbox/core/v2/paper/ImportFormat;->$VALUES:[Lcom/dropbox/core/v2/paper/ImportFormat;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/paper/ImportFormat;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/paper/ImportFormat;

    return-object v0
.end method
