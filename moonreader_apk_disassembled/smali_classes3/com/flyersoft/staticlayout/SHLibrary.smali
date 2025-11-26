.class abstract Lcom/flyersoft/staticlayout/SHLibrary;
.super Ljava/lang/Object;
.source "SHTextHyphenator.java"


# static fields
.field private static ourImplementation:Lcom/flyersoft/staticlayout/SHLibrary;


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 267
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 268
    sput-object p0, Lcom/flyersoft/staticlayout/SHLibrary;->ourImplementation:Lcom/flyersoft/staticlayout/SHLibrary;

    return-void
.end method

.method public static Instance()Lcom/flyersoft/staticlayout/SHLibrary;
    .locals 1

    .line 262
    sget-object v0, Lcom/flyersoft/staticlayout/SHLibrary;->ourImplementation:Lcom/flyersoft/staticlayout/SHLibrary;

    return-object v0
.end method


# virtual methods
.method public abstract createResourceFile(Lcom/flyersoft/staticlayout/SHResourceFile;Ljava/lang/String;)Lcom/flyersoft/staticlayout/SHResourceFile;
.end method

.method public abstract createResourceFile(Ljava/lang/String;)Lcom/flyersoft/staticlayout/SHResourceFile;
.end method

.method public abstract defaultLanguageCodes()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getCurrentTimeString()Ljava/lang/String;
.end method

.method public abstract getDisplayDPI()I
.end method

.method public abstract getScreenBrightness()I
.end method

.method public abstract getVersionName()Ljava/lang/String;
.end method

.method public abstract setScreenBrightness(I)V
.end method
