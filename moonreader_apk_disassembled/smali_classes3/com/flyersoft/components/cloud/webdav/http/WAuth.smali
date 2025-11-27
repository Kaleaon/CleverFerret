.class public Lcom/flyersoft/components/cloud/webdav/http/WAuth;
.super Ljava/lang/Object;
.source "WAuth.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/cloud/webdav/http/WAuth$Auth;
    }
.end annotation


# static fields
.field private static auth:Lcom/flyersoft/components/cloud/webdav/http/WAuth$Auth;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAuth()Lcom/flyersoft/components/cloud/webdav/http/WAuth$Auth;
    .locals 1

    .line 15
    sget-object v0, Lcom/flyersoft/components/cloud/webdav/http/WAuth;->auth:Lcom/flyersoft/components/cloud/webdav/http/WAuth$Auth;

    return-object v0
.end method

.method public static setAuth(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 11
    new-instance v0, Lcom/flyersoft/components/cloud/webdav/http/WAuth$Auth;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/components/cloud/webdav/http/WAuth$Auth;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/flyersoft/components/cloud/webdav/http/WAuth;->auth:Lcom/flyersoft/components/cloud/webdav/http/WAuth$Auth;

    return-void
.end method
