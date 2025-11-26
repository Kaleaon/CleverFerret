.class public Lcom/dropbox/core/InvalidAccessTokenException;
.super Lcom/dropbox/core/DbxException;
.source "InvalidAccessTokenException.java"


# static fields
.field private static final serialVersionUID:J


# instance fields
.field private authError:Lcom/dropbox/core/v2/auth/AuthError;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/auth/AuthError;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1, p2}, Lcom/dropbox/core/DbxException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    iput-object p3, p0, Lcom/dropbox/core/InvalidAccessTokenException;->authError:Lcom/dropbox/core/v2/auth/AuthError;

    return-void
.end method


# virtual methods
.method public getAuthError()Lcom/dropbox/core/v2/auth/AuthError;
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/dropbox/core/InvalidAccessTokenException;->authError:Lcom/dropbox/core/v2/auth/AuthError;

    return-object v0
.end method
