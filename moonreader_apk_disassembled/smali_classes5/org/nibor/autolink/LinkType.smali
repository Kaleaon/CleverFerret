.class public final enum Lorg/nibor/autolink/LinkType;
.super Ljava/lang/Enum;
.source "LinkType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/nibor/autolink/LinkType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/nibor/autolink/LinkType;

.field public static final enum EMAIL:Lorg/nibor/autolink/LinkType;

.field public static final enum URL:Lorg/nibor/autolink/LinkType;

.field public static final enum WWW:Lorg/nibor/autolink/LinkType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 10
    new-instance v0, Lorg/nibor/autolink/LinkType;

    const-string v1, "URL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/nibor/autolink/LinkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/nibor/autolink/LinkType;->URL:Lorg/nibor/autolink/LinkType;

    .line 14
    new-instance v1, Lorg/nibor/autolink/LinkType;

    const-string v3, "EMAIL"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lorg/nibor/autolink/LinkType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lorg/nibor/autolink/LinkType;->EMAIL:Lorg/nibor/autolink/LinkType;

    .line 18
    new-instance v3, Lorg/nibor/autolink/LinkType;

    const-string v5, "WWW"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lorg/nibor/autolink/LinkType;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lorg/nibor/autolink/LinkType;->WWW:Lorg/nibor/autolink/LinkType;

    const/4 v5, 0x3

    .line 6
    new-array v5, v5, [Lorg/nibor/autolink/LinkType;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lorg/nibor/autolink/LinkType;->$VALUES:[Lorg/nibor/autolink/LinkType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 6
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/nibor/autolink/LinkType;
    .locals 1

    .line 6
    const-class v0, Lorg/nibor/autolink/LinkType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/nibor/autolink/LinkType;

    return-object p0
.end method

.method public static values()[Lorg/nibor/autolink/LinkType;
    .locals 1

    .line 6
    sget-object v0, Lorg/nibor/autolink/LinkType;->$VALUES:[Lorg/nibor/autolink/LinkType;

    invoke-virtual {v0}, [Lorg/nibor/autolink/LinkType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/nibor/autolink/LinkType;

    return-object v0
.end method
