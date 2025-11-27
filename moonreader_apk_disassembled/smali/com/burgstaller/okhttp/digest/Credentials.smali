.class public Lcom/burgstaller/okhttp/digest/Credentials;
.super Ljava/lang/Object;
.source "Credentials.java"


# instance fields
.field private password:Ljava/lang/String;

.field private userName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/burgstaller/okhttp/digest/Credentials;->userName:Ljava/lang/String;

    .line 12
    iput-object p2, p0, Lcom/burgstaller/okhttp/digest/Credentials;->password:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getPassword()Ljava/lang/String;
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/Credentials;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .line 16
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/Credentials;->userName:Ljava/lang/String;

    return-object v0
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0

    .line 28
    iput-object p1, p0, Lcom/burgstaller/okhttp/digest/Credentials;->password:Ljava/lang/String;

    return-void
.end method

.method public setUserName(Ljava/lang/String;)V
    .locals 0

    .line 20
    iput-object p1, p0, Lcom/burgstaller/okhttp/digest/Credentials;->userName:Ljava/lang/String;

    return-void
.end method
