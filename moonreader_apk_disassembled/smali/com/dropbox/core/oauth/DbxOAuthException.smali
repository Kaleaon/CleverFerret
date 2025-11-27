.class public Lcom/dropbox/core/oauth/DbxOAuthException;
.super Lcom/dropbox/core/DbxException;
.source "DbxOAuthException.java"


# static fields
.field private static final serialVersionUID:J


# instance fields
.field private final dbxOAuthError:Lcom/dropbox/core/oauth/DbxOAuthError;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/dropbox/core/oauth/DbxOAuthError;)V
    .locals 1

    .line 14
    invoke-virtual {p2}, Lcom/dropbox/core/oauth/DbxOAuthError;->getErrorDescription()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/dropbox/core/DbxException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    iput-object p2, p0, Lcom/dropbox/core/oauth/DbxOAuthException;->dbxOAuthError:Lcom/dropbox/core/oauth/DbxOAuthError;

    return-void
.end method


# virtual methods
.method public getDbxOAuthError()Lcom/dropbox/core/oauth/DbxOAuthError;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/dropbox/core/oauth/DbxOAuthException;->dbxOAuthError:Lcom/dropbox/core/oauth/DbxOAuthError;

    return-object v0
.end method
