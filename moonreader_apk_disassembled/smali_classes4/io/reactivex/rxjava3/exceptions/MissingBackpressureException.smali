.class public final Lio/reactivex/rxjava3/exceptions/MissingBackpressureException;
.super Ljava/lang/RuntimeException;
.source "MissingBackpressureException.java"


# static fields
.field public static final DEFAULT_MESSAGE:Ljava/lang/String; = "Could not emit value due to lack of requests"

.field private static final serialVersionUID:J = 0x7633afeb6fd3471eL


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "message"
        }
    .end annotation

    .line 44
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public static createDefault()Lio/reactivex/rxjava3/exceptions/MissingBackpressureException;
    .locals 2

    .line 54
    new-instance v0, Lio/reactivex/rxjava3/exceptions/MissingBackpressureException;

    const-string v1, "Could not emit value due to lack of requests"

    invoke-direct {v0, v1}, Lio/reactivex/rxjava3/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
