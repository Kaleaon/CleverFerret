.class public final Lcom/dropbox/core/DbxOAuth1AccessToken;
.super Ljava/lang/Object;
.source "DbxOAuth1AccessToken.java"


# instance fields
.field private final key:Ljava/lang/String;

.field private final secret:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/dropbox/core/DbxOAuth1AccessToken;->key:Ljava/lang/String;

    .line 18
    iput-object p2, p0, Lcom/dropbox/core/DbxOAuth1AccessToken;->secret:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/String;
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/dropbox/core/DbxOAuth1AccessToken;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getSecret()Ljava/lang/String;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/dropbox/core/DbxOAuth1AccessToken;->secret:Ljava/lang/String;

    return-object v0
.end method
