.class public final Lcom/dropbox/core/android/DropboxUidNotInitializedException;
.super Lcom/dropbox/core/DbxException;
.source "DropboxUidNotInitializedException.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/android/DropboxUidNotInitializedException$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0018\u0000 \u00052\u00020\u0001:\u0001\u0005B\u000f\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0002\u0010\u0004\u00a8\u0006\u0006"
    }
    d2 = {
        "Lcom/dropbox/core/android/DropboxUidNotInitializedException;",
        "Lcom/dropbox/core/DbxException;",
        "message",
        "",
        "(Ljava/lang/String;)V",
        "Companion",
        "android_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x6,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final Companion:Lcom/dropbox/core/android/DropboxUidNotInitializedException$Companion;

.field private static final serialVersionUID:J = 0x1L
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/dropbox/core/android/DropboxUidNotInitializedException$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/dropbox/core/android/DropboxUidNotInitializedException$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/dropbox/core/android/DropboxUidNotInitializedException;->Companion:Lcom/dropbox/core/android/DropboxUidNotInitializedException$Companion;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1}, Lcom/dropbox/core/DbxException;-><init>(Ljava/lang/String;)V

    return-void
.end method
