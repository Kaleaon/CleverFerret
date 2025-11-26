.class public Lcom/dropbox/core/v2/team/ListTeamDevicesErrorException;
.super Lcom/dropbox/core/DbxApiException;
.source "ListTeamDevicesErrorException.java"


# static fields
.field private static final serialVersionUID:J


# instance fields
.field public final errorValue:Lcom/dropbox/core/v2/team/ListTeamDevicesError;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/team/ListTeamDevicesError;)V
    .locals 0

    .line 28
    invoke-static {p1, p3, p4}, Lcom/dropbox/core/v2/team/ListTeamDevicesErrorException;->buildMessage(Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p2, p3, p1}, Lcom/dropbox/core/DbxApiException;-><init>(Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Ljava/lang/String;)V

    if-eqz p4, :cond_0

    .line 32
    iput-object p4, p0, Lcom/dropbox/core/v2/team/ListTeamDevicesErrorException;->errorValue:Lcom/dropbox/core/v2/team/ListTeamDevicesError;

    return-void

    .line 30
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "errorValue"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
