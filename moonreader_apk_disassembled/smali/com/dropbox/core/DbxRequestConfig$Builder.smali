.class public final Lcom/dropbox/core/DbxRequestConfig$Builder;
.super Ljava/lang/Object;
.source "DbxRequestConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/DbxRequestConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private final clientIdentifier:Ljava/lang/String;

.field private httpRequestor:Lcom/dropbox/core/http/HttpRequestor;

.field private maxRetries:I

.field private userLocale:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 245
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 246
    iput-object p1, p0, Lcom/dropbox/core/DbxRequestConfig$Builder;->clientIdentifier:Ljava/lang/String;

    const/4 p1, 0x0

    .line 248
    iput-object p1, p0, Lcom/dropbox/core/DbxRequestConfig$Builder;->userLocale:Ljava/lang/String;

    .line 249
    sget-object p1, Lcom/dropbox/core/http/StandardHttpRequestor;->INSTANCE:Lcom/dropbox/core/http/StandardHttpRequestor;

    iput-object p1, p0, Lcom/dropbox/core/DbxRequestConfig$Builder;->httpRequestor:Lcom/dropbox/core/http/HttpRequestor;

    const/4 p1, 0x0

    .line 250
    iput p1, p0, Lcom/dropbox/core/DbxRequestConfig$Builder;->maxRetries:I

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig$1;)V
    .locals 0

    .line 228
    invoke-direct {p0, p1}, Lcom/dropbox/core/DbxRequestConfig$Builder;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/http/HttpRequestor;I)V
    .locals 0

    .line 238
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 239
    iput-object p1, p0, Lcom/dropbox/core/DbxRequestConfig$Builder;->clientIdentifier:Ljava/lang/String;

    .line 240
    iput-object p2, p0, Lcom/dropbox/core/DbxRequestConfig$Builder;->userLocale:Ljava/lang/String;

    .line 241
    iput-object p3, p0, Lcom/dropbox/core/DbxRequestConfig$Builder;->httpRequestor:Lcom/dropbox/core/http/HttpRequestor;

    .line 242
    iput p4, p0, Lcom/dropbox/core/DbxRequestConfig$Builder;->maxRetries:I

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/http/HttpRequestor;ILcom/dropbox/core/DbxRequestConfig$1;)V
    .locals 0

    .line 228
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/dropbox/core/DbxRequestConfig$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/http/HttpRequestor;I)V

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/DbxRequestConfig;
    .locals 6

    .line 381
    new-instance v0, Lcom/dropbox/core/DbxRequestConfig;

    iget-object v1, p0, Lcom/dropbox/core/DbxRequestConfig$Builder;->clientIdentifier:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/DbxRequestConfig$Builder;->userLocale:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/DbxRequestConfig$Builder;->httpRequestor:Lcom/dropbox/core/http/HttpRequestor;

    iget v4, p0, Lcom/dropbox/core/DbxRequestConfig$Builder;->maxRetries:I

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/DbxRequestConfig;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/http/HttpRequestor;ILcom/dropbox/core/DbxRequestConfig$1;)V

    return-object v0
.end method

.method public withAutoRetryDisabled()Lcom/dropbox/core/DbxRequestConfig$Builder;
    .locals 1

    const/4 v0, 0x0

    .line 342
    iput v0, p0, Lcom/dropbox/core/DbxRequestConfig$Builder;->maxRetries:I

    return-object p0
.end method

.method public withAutoRetryEnabled()Lcom/dropbox/core/DbxRequestConfig$Builder;
    .locals 1

    const/4 v0, 0x3

    .line 328
    invoke-virtual {p0, v0}, Lcom/dropbox/core/DbxRequestConfig$Builder;->withAutoRetryEnabled(I)Lcom/dropbox/core/DbxRequestConfig$Builder;

    move-result-object v0

    return-object v0
.end method

.method public withAutoRetryEnabled(I)Lcom/dropbox/core/DbxRequestConfig$Builder;
    .locals 1

    if-lez p1, :cond_0

    .line 370
    iput p1, p0, Lcom/dropbox/core/DbxRequestConfig$Builder;->maxRetries:I

    return-object p0

    .line 369
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "maxRetries must be positive"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public withHttpRequestor(Lcom/dropbox/core/http/HttpRequestor;)Lcom/dropbox/core/DbxRequestConfig$Builder;
    .locals 1

    if-eqz p1, :cond_0

    .line 311
    iput-object p1, p0, Lcom/dropbox/core/DbxRequestConfig$Builder;->httpRequestor:Lcom/dropbox/core/http/HttpRequestor;

    return-object p0

    .line 310
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "httpRequestor"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public withUserLocale(Ljava/lang/String;)Lcom/dropbox/core/DbxRequestConfig$Builder;
    .locals 0

    .line 266
    iput-object p1, p0, Lcom/dropbox/core/DbxRequestConfig$Builder;->userLocale:Ljava/lang/String;

    return-object p0
.end method

.method public withUserLocaleFrom(Ljava/util/Locale;)Lcom/dropbox/core/DbxRequestConfig$Builder;
    .locals 0

    .line 296
    invoke-static {p1}, Lcom/dropbox/core/DbxRequestConfig;->access$200(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/DbxRequestConfig$Builder;->userLocale:Ljava/lang/String;

    return-object p0
.end method

.method public withUserLocaleFromPreferences()Lcom/dropbox/core/DbxRequestConfig$Builder;
    .locals 1

    const/4 v0, 0x0

    .line 280
    iput-object v0, p0, Lcom/dropbox/core/DbxRequestConfig$Builder;->userLocale:Ljava/lang/String;

    return-object p0
.end method
