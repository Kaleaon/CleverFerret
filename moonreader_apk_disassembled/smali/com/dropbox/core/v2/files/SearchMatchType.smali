.class public final enum Lcom/dropbox/core/v2/files/SearchMatchType;
.super Ljava/lang/Enum;
.source "SearchMatchType.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/SearchMatchType$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/files/SearchMatchType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/files/SearchMatchType;

.field public static final enum BOTH:Lcom/dropbox/core/v2/files/SearchMatchType;

.field public static final enum CONTENT:Lcom/dropbox/core/v2/files/SearchMatchType;

.field public static final enum FILENAME:Lcom/dropbox/core/v2/files/SearchMatchType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 27
    new-instance v0, Lcom/dropbox/core/v2/files/SearchMatchType;

    const-string v1, "FILENAME"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/files/SearchMatchType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/files/SearchMatchType;->FILENAME:Lcom/dropbox/core/v2/files/SearchMatchType;

    .line 31
    new-instance v1, Lcom/dropbox/core/v2/files/SearchMatchType;

    const-string v3, "CONTENT"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/files/SearchMatchType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/files/SearchMatchType;->CONTENT:Lcom/dropbox/core/v2/files/SearchMatchType;

    .line 35
    new-instance v3, Lcom/dropbox/core/v2/files/SearchMatchType;

    const-string v5, "BOTH"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/files/SearchMatchType;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/files/SearchMatchType;->BOTH:Lcom/dropbox/core/v2/files/SearchMatchType;

    const/4 v5, 0x3

    .line 22
    new-array v5, v5, [Lcom/dropbox/core/v2/files/SearchMatchType;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/dropbox/core/v2/files/SearchMatchType;->$VALUES:[Lcom/dropbox/core/v2/files/SearchMatchType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/files/SearchMatchType;
    .locals 1

    .line 22
    const-class v0, Lcom/dropbox/core/v2/files/SearchMatchType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/files/SearchMatchType;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/files/SearchMatchType;
    .locals 1

    .line 22
    sget-object v0, Lcom/dropbox/core/v2/files/SearchMatchType;->$VALUES:[Lcom/dropbox/core/v2/files/SearchMatchType;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/files/SearchMatchType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/files/SearchMatchType;

    return-object v0
.end method
