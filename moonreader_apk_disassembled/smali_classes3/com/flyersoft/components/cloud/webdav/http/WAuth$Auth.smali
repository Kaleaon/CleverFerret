.class public Lcom/flyersoft/components/cloud/webdav/http/WAuth$Auth;
.super Ljava/lang/Object;
.source "WAuth.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/cloud/webdav/http/WAuth;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Auth"
.end annotation


# instance fields
.field private pass:Ljava/lang/String;

.field private user:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/flyersoft/components/cloud/webdav/http/WAuth$Auth;->user:Ljava/lang/String;

    .line 24
    iput-object p2, p0, Lcom/flyersoft/components/cloud/webdav/http/WAuth$Auth;->pass:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getPass()Ljava/lang/String;
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/flyersoft/components/cloud/webdav/http/WAuth$Auth;->pass:Ljava/lang/String;

    return-object v0
.end method

.method public getUser()Ljava/lang/String;
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/flyersoft/components/cloud/webdav/http/WAuth$Auth;->user:Ljava/lang/String;

    return-object v0
.end method
