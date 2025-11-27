.class public Lcom/facebook/soloader/SoLoaderULError;
.super Ljava/lang/UnsatisfiedLinkError;
.source "SoLoaderULError.java"


# instance fields
.field private mSoName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/UnsatisfiedLinkError;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/facebook/soloader/SoLoaderULError;->mSoName:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 25
    invoke-direct {p0, p2}, Ljava/lang/UnsatisfiedLinkError;-><init>(Ljava/lang/String;)V

    .line 26
    iput-object p1, p0, Lcom/facebook/soloader/SoLoaderULError;->mSoName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getSoName()Ljava/lang/String;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/facebook/soloader/SoLoaderULError;->mSoName:Ljava/lang/String;

    return-object v0
.end method
