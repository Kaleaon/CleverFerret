.class public final enum Lorg/apache/commons/net/imap/IMAP$IMAPState;
.super Ljava/lang/Enum;
.source "IMAP.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/net/imap/IMAP;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "IMAPState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/commons/net/imap/IMAP$IMAPState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/net/imap/IMAP$IMAPState;

.field public static final enum AUTH_STATE:Lorg/apache/commons/net/imap/IMAP$IMAPState;

.field public static final enum DISCONNECTED_STATE:Lorg/apache/commons/net/imap/IMAP$IMAPState;

.field public static final enum LOGOUT_STATE:Lorg/apache/commons/net/imap/IMAP$IMAPState;

.field public static final enum NOT_AUTH_STATE:Lorg/apache/commons/net/imap/IMAP$IMAPState;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 46
    new-instance v0, Lorg/apache/commons/net/imap/IMAP$IMAPState;

    const-string v1, "DISCONNECTED_STATE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/net/imap/IMAP$IMAPState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/net/imap/IMAP$IMAPState;->DISCONNECTED_STATE:Lorg/apache/commons/net/imap/IMAP$IMAPState;

    .line 48
    new-instance v1, Lorg/apache/commons/net/imap/IMAP$IMAPState;

    const-string v3, "NOT_AUTH_STATE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lorg/apache/commons/net/imap/IMAP$IMAPState;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lorg/apache/commons/net/imap/IMAP$IMAPState;->NOT_AUTH_STATE:Lorg/apache/commons/net/imap/IMAP$IMAPState;

    .line 50
    new-instance v3, Lorg/apache/commons/net/imap/IMAP$IMAPState;

    const-string v5, "AUTH_STATE"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lorg/apache/commons/net/imap/IMAP$IMAPState;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lorg/apache/commons/net/imap/IMAP$IMAPState;->AUTH_STATE:Lorg/apache/commons/net/imap/IMAP$IMAPState;

    .line 52
    new-instance v5, Lorg/apache/commons/net/imap/IMAP$IMAPState;

    const-string v7, "LOGOUT_STATE"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lorg/apache/commons/net/imap/IMAP$IMAPState;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lorg/apache/commons/net/imap/IMAP$IMAPState;->LOGOUT_STATE:Lorg/apache/commons/net/imap/IMAP$IMAPState;

    const/4 v7, 0x4

    .line 43
    new-array v7, v7, [Lorg/apache/commons/net/imap/IMAP$IMAPState;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lorg/apache/commons/net/imap/IMAP$IMAPState;->$VALUES:[Lorg/apache/commons/net/imap/IMAP$IMAPState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 43
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/net/imap/IMAP$IMAPState;
    .locals 1

    .line 43
    const-class v0, Lorg/apache/commons/net/imap/IMAP$IMAPState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/apache/commons/net/imap/IMAP$IMAPState;

    return-object p0
.end method

.method public static values()[Lorg/apache/commons/net/imap/IMAP$IMAPState;
    .locals 1

    .line 43
    sget-object v0, Lorg/apache/commons/net/imap/IMAP$IMAPState;->$VALUES:[Lorg/apache/commons/net/imap/IMAP$IMAPState;

    invoke-virtual {v0}, [Lorg/apache/commons/net/imap/IMAP$IMAPState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/net/imap/IMAP$IMAPState;

    return-object v0
.end method
