.class public Lcom/github/junrar/exception/RarException;
.super Ljava/lang/Exception;
.source "RarException.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/junrar/exception/RarException$RarExceptionType;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private type:Lcom/github/junrar/exception/RarException$RarExceptionType;


# direct methods
.method public constructor <init>(Lcom/github/junrar/exception/RarException$RarExceptionType;)V
    .locals 1

    .line 47
    invoke-virtual {p1}, Lcom/github/junrar/exception/RarException$RarExceptionType;->name()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 48
    iput-object p1, p0, Lcom/github/junrar/exception/RarException;->type:Lcom/github/junrar/exception/RarException$RarExceptionType;

    return-void
.end method

.method public constructor <init>(Lcom/github/junrar/exception/RarException;)V
    .locals 1

    .line 42
    invoke-virtual {p1}, Lcom/github/junrar/exception/RarException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 43
    invoke-virtual {p1}, Lcom/github/junrar/exception/RarException;->getType()Lcom/github/junrar/exception/RarException$RarExceptionType;

    move-result-object p1

    iput-object p1, p0, Lcom/github/junrar/exception/RarException;->type:Lcom/github/junrar/exception/RarException$RarExceptionType;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Exception;)V
    .locals 1

    .line 31
    sget-object v0, Lcom/github/junrar/exception/RarException$RarExceptionType;->unkownError:Lcom/github/junrar/exception/RarException$RarExceptionType;

    invoke-virtual {v0}, Lcom/github/junrar/exception/RarException$RarExceptionType;->name()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 32
    sget-object p1, Lcom/github/junrar/exception/RarException$RarExceptionType;->unkownError:Lcom/github/junrar/exception/RarException$RarExceptionType;

    iput-object p1, p0, Lcom/github/junrar/exception/RarException;->type:Lcom/github/junrar/exception/RarException$RarExceptionType;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Exception;Lcom/github/junrar/exception/RarException$RarExceptionType;)V
    .locals 1

    .line 36
    invoke-virtual {p2}, Lcom/github/junrar/exception/RarException$RarExceptionType;->name()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 37
    iput-object p2, p0, Lcom/github/junrar/exception/RarException;->type:Lcom/github/junrar/exception/RarException$RarExceptionType;

    return-void
.end method


# virtual methods
.method public getType()Lcom/github/junrar/exception/RarException$RarExceptionType;
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/github/junrar/exception/RarException;->type:Lcom/github/junrar/exception/RarException$RarExceptionType;

    return-object v0
.end method

.method public setType(Lcom/github/junrar/exception/RarException$RarExceptionType;)V
    .locals 0

    .line 74
    iput-object p1, p0, Lcom/github/junrar/exception/RarException;->type:Lcom/github/junrar/exception/RarException$RarExceptionType;

    return-void
.end method
