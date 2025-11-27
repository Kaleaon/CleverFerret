.class public Lcom/dropbox/core/BadResponseCodeException;
.super Lcom/dropbox/core/BadResponseException;
.source "BadResponseCodeException.java"


# static fields
.field private static final serialVersionUID:J


# instance fields
.field private final statusCode:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Lcom/dropbox/core/BadResponseException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    iput p3, p0, Lcom/dropbox/core/BadResponseCodeException;->statusCode:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Throwable;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p4}, Lcom/dropbox/core/BadResponseException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    iput p3, p0, Lcom/dropbox/core/BadResponseCodeException;->statusCode:I

    return-void
.end method


# virtual methods
.method public getStatusCode()I
    .locals 1

    .line 27
    iget v0, p0, Lcom/dropbox/core/BadResponseCodeException;->statusCode:I

    return v0
.end method
