.class public Lcom/dropbox/core/v2/team/ExcludedUsersUpdateErrorException;
.super Lcom/dropbox/core/DbxApiException;
.source "ExcludedUsersUpdateErrorException.java"


# static fields
.field private static final serialVersionUID:J


# instance fields
.field public final errorValue:Lcom/dropbox/core/v2/team/ExcludedUsersUpdateError;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/team/ExcludedUsersUpdateError;)V
    .locals 0

    .line 35
    invoke-static {p1, p3, p4}, Lcom/dropbox/core/v2/team/ExcludedUsersUpdateErrorException;->buildMessage(Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p2, p3, p1}, Lcom/dropbox/core/DbxApiException;-><init>(Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Ljava/lang/String;)V

    if-eqz p4, :cond_0

    .line 39
    iput-object p4, p0, Lcom/dropbox/core/v2/team/ExcludedUsersUpdateErrorException;->errorValue:Lcom/dropbox/core/v2/team/ExcludedUsersUpdateError;

    return-void

    .line 37
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "errorValue"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
