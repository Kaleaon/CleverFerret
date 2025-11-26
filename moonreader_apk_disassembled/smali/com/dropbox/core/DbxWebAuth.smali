.class public Lcom/dropbox/core/DbxWebAuth;
.super Ljava/lang/Object;
.source "DbxWebAuth.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/DbxWebAuth$Request;,
        Lcom/dropbox/core/DbxWebAuth$ProviderException;,
        Lcom/dropbox/core/DbxWebAuth$NotApprovedException;,
        Lcom/dropbox/core/DbxWebAuth$CsrfException;,
        Lcom/dropbox/core/DbxWebAuth$BadStateException;,
        Lcom/dropbox/core/DbxWebAuth$BadRequestException;,
        Lcom/dropbox/core/DbxWebAuth$Exception;
    }
.end annotation


# static fields
.field private static final CSRF_BYTES_SIZE:I = 0x10

.field private static final CSRF_STRING_SIZE:I

.field private static final RAND:Ljava/security/SecureRandom;

.field public static final ROLE_PERSONAL:Ljava/lang/String; = "personal"

.field public static final ROLE_WORK:Ljava/lang/String; = "work"


# instance fields
.field final appInfo:Lcom/dropbox/core/DbxAppInfo;

.field final deprecatedRequest:Lcom/dropbox/core/DbxWebAuth$Request;

.field final requestConfig:Lcom/dropbox/core/DbxRequestConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 139
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    sput-object v0, Lcom/dropbox/core/DbxWebAuth;->RAND:Ljava/security/SecureRandom;

    const/16 v0, 0x10

    .line 141
    new-array v0, v0, [B

    invoke-static {v0}, Lcom/dropbox/core/util/StringUtil;->urlSafeBase64Encode([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    sput v0, Lcom/dropbox/core/DbxWebAuth;->CSRF_STRING_SIZE:I

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxAppInfo;)V
    .locals 0

    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    .line 189
    iput-object p1, p0, Lcom/dropbox/core/DbxWebAuth;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    .line 190
    iput-object p2, p0, Lcom/dropbox/core/DbxWebAuth;->appInfo:Lcom/dropbox/core/DbxAppInfo;

    const/4 p1, 0x0

    .line 191
    iput-object p1, p0, Lcom/dropbox/core/DbxWebAuth;->deprecatedRequest:Lcom/dropbox/core/DbxWebAuth$Request;

    return-void

    .line 187
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "appInfo"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 186
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "requestConfig"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxAppInfo;Ljava/lang/String;Lcom/dropbox/core/DbxSessionStore;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 165
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    .line 170
    iput-object p1, p0, Lcom/dropbox/core/DbxWebAuth;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    .line 171
    iput-object p2, p0, Lcom/dropbox/core/DbxWebAuth;->appInfo:Lcom/dropbox/core/DbxAppInfo;

    .line 172
    invoke-static {}, Lcom/dropbox/core/DbxWebAuth;->newRequestBuilder()Lcom/dropbox/core/DbxWebAuth$Request$Builder;

    move-result-object p1

    .line 173
    invoke-virtual {p1, p3, p4}, Lcom/dropbox/core/DbxWebAuth$Request$Builder;->withRedirectUri(Ljava/lang/String;Lcom/dropbox/core/DbxSessionStore;)Lcom/dropbox/core/DbxWebAuth$Request$Builder;

    move-result-object p1

    .line 174
    invoke-virtual {p1}, Lcom/dropbox/core/DbxWebAuth$Request$Builder;->build()Lcom/dropbox/core/DbxWebAuth$Request;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/DbxWebAuth;->deprecatedRequest:Lcom/dropbox/core/DbxWebAuth$Request;

    return-void

    .line 167
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "appInfo"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 166
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "requestConfig"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$1200()I
    .locals 1

    .line 138
    sget v0, Lcom/dropbox/core/DbxWebAuth;->CSRF_STRING_SIZE:I

    return v0
.end method

.method private static appendCsrfToken(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/String;
    .locals 3

    const/16 v0, 0x10

    .line 498
    new-array v0, v0, [B

    .line 499
    sget-object v1, Lcom/dropbox/core/DbxWebAuth;->RAND:Ljava/security/SecureRandom;

    invoke-virtual {v1, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 500
    invoke-static {v0}, Lcom/dropbox/core/util/StringUtil;->urlSafeBase64Encode([B)Ljava/lang/String;

    move-result-object v0

    .line 502
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    sget v2, Lcom/dropbox/core/DbxWebAuth;->CSRF_STRING_SIZE:I

    if-ne v1, v2, :cond_3

    .line 506
    invoke-static {p0}, Lcom/dropbox/core/DbxWebAuth$Request;->access$700(Lcom/dropbox/core/DbxWebAuth$Request;)Lcom/dropbox/core/DbxSessionStore;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 507
    invoke-static {p0}, Lcom/dropbox/core/DbxWebAuth$Request;->access$700(Lcom/dropbox/core/DbxWebAuth$Request;)Lcom/dropbox/core/DbxSessionStore;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/dropbox/core/DbxSessionStore;->set(Ljava/lang/String;)V

    .line 510
    :cond_0
    invoke-static {p0}, Lcom/dropbox/core/DbxWebAuth$Request;->access$800(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    return-object v0

    .line 513
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/dropbox/core/DbxWebAuth$Request;->access$800(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 514
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1f4

    if-gt v0, v1, :cond_2

    return-object p0

    .line 515
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "unexpected combined state length: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 503
    :cond_3
    new-instance p0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "unexpected CSRF token length: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0
.end method

.method private authorizeImpl(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 264
    invoke-virtual {p0, p1, v0}, Lcom/dropbox/core/DbxWebAuth;->authorizeImpl(Lcom/dropbox/core/DbxWebAuth$Request;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private finish(Ljava/lang/String;)Lcom/dropbox/core/DbxAuthFinish;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 420
    invoke-virtual {p0, p1, v0, v0}, Lcom/dropbox/core/DbxWebAuth;->finish(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/DbxAuthFinish;

    move-result-object p1

    return-object p1
.end method

.method static getParam(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxWebAuth$BadRequestException;
        }
    .end annotation

    .line 548
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 552
    :cond_0
    array-length v0, p0

    if-eqz v0, :cond_2

    .line 554
    array-length v0, p0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    const/4 p1, 0x0

    .line 555
    aget-object p0, p0, p1

    return-object p0

    .line 557
    :cond_1
    new-instance p0, Lcom/dropbox/core/DbxWebAuth$BadRequestException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "multiple occurrences of \""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\" parameter"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/dropbox/core/DbxWebAuth$BadRequestException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 553
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Parameter \""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\" missing value."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static newRequestBuilder()Lcom/dropbox/core/DbxWebAuth$Request$Builder;
    .locals 1

    .line 652
    invoke-static {}, Lcom/dropbox/core/DbxWebAuth$Request;->newBuilder()Lcom/dropbox/core/DbxWebAuth$Request$Builder;

    move-result-object v0

    return-object v0
.end method

.method static validateRedirectUri(Ljava/lang/String;Lcom/dropbox/core/DbxSessionStore;Ljava/util/Map;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/DbxSessionStore;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxWebAuth$BadRequestException;,
            Lcom/dropbox/core/DbxWebAuth$BadStateException;,
            Lcom/dropbox/core/DbxWebAuth$CsrfException;,
            Lcom/dropbox/core/DbxWebAuth$NotApprovedException;,
            Lcom/dropbox/core/DbxWebAuth$ProviderException;
        }
    .end annotation

    if-eqz p0, :cond_d

    if-eqz p1, :cond_c

    if-eqz p2, :cond_b

    .line 379
    const-string p0, "state"

    invoke-static {p2, p0}, Lcom/dropbox/core/DbxWebAuth;->getParam(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_a

    .line 384
    const-string v0, "error"

    invoke-static {p2, v0}, Lcom/dropbox/core/DbxWebAuth;->getParam(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 385
    const-string v1, "code"

    invoke-static {p2, v1}, Lcom/dropbox/core/DbxWebAuth;->getParam(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 386
    const-string v2, "error_description"

    invoke-static {p2, v2}, Lcom/dropbox/core/DbxWebAuth;->getParam(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-nez v1, :cond_1

    if-eqz v0, :cond_0

    goto :goto_0

    .line 389
    :cond_0
    new-instance p0, Lcom/dropbox/core/DbxWebAuth$BadRequestException;

    const-string p1, "Missing both \"code\" and \"error\"."

    invoke-direct {p0, p1}, Lcom/dropbox/core/DbxWebAuth$BadRequestException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    :goto_0
    if-eqz v1, :cond_3

    if-nez v0, :cond_2

    goto :goto_1

    .line 392
    :cond_2
    new-instance p0, Lcom/dropbox/core/DbxWebAuth$BadRequestException;

    const-string p1, "Both \"code\" and \"error\" are set."

    invoke-direct {p0, p1}, Lcom/dropbox/core/DbxWebAuth$BadRequestException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3
    :goto_1
    if-eqz v1, :cond_5

    if-nez p2, :cond_4

    goto :goto_2

    .line 395
    :cond_4
    new-instance p0, Lcom/dropbox/core/DbxWebAuth$BadRequestException;

    const-string p1, "Both \"code\" and \"error_description\" are set."

    invoke-direct {p0, p1}, Lcom/dropbox/core/DbxWebAuth$BadRequestException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 398
    :cond_5
    :goto_2
    invoke-static {p0, p1}, Lcom/dropbox/core/DbxWebAuth;->verifyAndStripCsrfToken(Ljava/lang/String;Lcom/dropbox/core/DbxSessionStore;)Ljava/lang/String;

    move-result-object p0

    if-eqz v0, :cond_9

    .line 401
    const-string p0, "access_denied"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_7

    if-nez p2, :cond_6

    .line 404
    const-string p0, "No additional description from Dropbox"

    goto :goto_3

    .line 405
    :cond_6
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "Additional description from Dropbox: "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 406
    :goto_3
    new-instance p1, Lcom/dropbox/core/DbxWebAuth$NotApprovedException;

    invoke-direct {p1, p0}, Lcom/dropbox/core/DbxWebAuth$NotApprovedException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_7
    if-nez p2, :cond_8

    goto :goto_4

    :cond_8
    const/4 p0, 0x2

    .line 411
    new-array p0, p0, [Ljava/lang/Object;

    const/4 p1, 0x0

    aput-object v0, p0, p1

    const/4 p1, 0x1

    aput-object p2, p0, p1

    const-string p1, "%s: %s"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 412
    :goto_4
    new-instance p0, Lcom/dropbox/core/DbxWebAuth$ProviderException;

    invoke-direct {p0, v0}, Lcom/dropbox/core/DbxWebAuth$ProviderException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_9
    return-object p0

    .line 381
    :cond_a
    new-instance p0, Lcom/dropbox/core/DbxWebAuth$BadRequestException;

    const-string p1, "Missing required parameter: \"state\"."

    invoke-direct {p0, p1}, Lcom/dropbox/core/DbxWebAuth$BadRequestException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 377
    :cond_b
    new-instance p0, Ljava/lang/NullPointerException;

    const-string p1, "params"

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 376
    :cond_c
    new-instance p0, Ljava/lang/NullPointerException;

    const-string p1, "sessionStore"

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 375
    :cond_d
    new-instance p0, Ljava/lang/NullPointerException;

    const-string p1, "redirectUri"

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static verifyAndStripCsrfToken(Ljava/lang/String;Lcom/dropbox/core/DbxSessionStore;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxWebAuth$CsrfException;,
            Lcom/dropbox/core/DbxWebAuth$BadStateException;
        }
    .end annotation

    .line 523
    invoke-interface {p1}, Lcom/dropbox/core/DbxSessionStore;->get()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 527
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    sget v2, Lcom/dropbox/core/DbxWebAuth;->CSRF_STRING_SIZE:I

    if-lt v1, v2, :cond_3

    .line 531
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v1, v2, :cond_2

    const/4 v1, 0x0

    .line 535
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 536
    invoke-static {v0, v1}, Lcom/dropbox/core/util/StringUtil;->secureStringEquals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 540
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 542
    invoke-interface {p1}, Lcom/dropbox/core/DbxSessionStore;->clear()V

    .line 544
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p0, 0x0

    :cond_0
    return-object p0

    .line 537
    :cond_1
    new-instance p0, Lcom/dropbox/core/DbxWebAuth$CsrfException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v2, "expecting "

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/dropbox/core/util/StringUtil;->jq(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", got "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/dropbox/core/util/StringUtil;->jq(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/dropbox/core/DbxWebAuth$CsrfException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 532
    :cond_2
    new-instance p1, Lcom/dropbox/core/DbxWebAuth$CsrfException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Token too small: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lcom/dropbox/core/DbxWebAuth$CsrfException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 528
    :cond_3
    new-instance p0, Lcom/dropbox/core/DbxWebAuth$BadStateException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "Token retrieved from session store is too small: "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/dropbox/core/DbxWebAuth$BadStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 525
    :cond_4
    new-instance p0, Lcom/dropbox/core/DbxWebAuth$BadStateException;

    const-string p1, "No CSRF Token loaded from session store."

    invoke-direct {p0, p1}, Lcom/dropbox/core/DbxWebAuth$BadStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public authorize(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/String;
    .locals 1

    .line 252
    iget-object v0, p0, Lcom/dropbox/core/DbxWebAuth;->deprecatedRequest:Lcom/dropbox/core/DbxWebAuth$Request;

    if-nez v0, :cond_1

    .line 256
    iget-object v0, p0, Lcom/dropbox/core/DbxWebAuth;->appInfo:Lcom/dropbox/core/DbxAppInfo;

    invoke-virtual {v0}, Lcom/dropbox/core/DbxAppInfo;->hasSecret()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 260
    invoke-direct {p0, p1}, Lcom/dropbox/core/DbxWebAuth;->authorizeImpl(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 257
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "For native apps, please use DbxPKCEWebAuth"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 253
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Must create this instance using DbxWebAuth(DbxRequestConfig,DbxAppInfo) to call this method."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method authorizeImpl(Lcom/dropbox/core/DbxWebAuth$Request;Ljava/util/Map;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/DbxWebAuth$Request;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 268
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 270
    iget-object v1, p0, Lcom/dropbox/core/DbxWebAuth;->appInfo:Lcom/dropbox/core/DbxAppInfo;

    invoke-virtual {v1}, Lcom/dropbox/core/DbxAppInfo;->getKey()Ljava/lang/String;

    move-result-object v1

    const-string v2, "client_id"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    const-string v1, "response_type"

    const-string v2, "code"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    invoke-static {p1}, Lcom/dropbox/core/DbxWebAuth$Request;->access$000(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 274
    const-string v1, "redirect_uri"

    invoke-static {p1}, Lcom/dropbox/core/DbxWebAuth$Request;->access$000(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    const-string v1, "state"

    invoke-static {p1}, Lcom/dropbox/core/DbxWebAuth;->appendCsrfToken(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/DbxWebAuth$Request;->access$100(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 279
    const-string v1, "require_role"

    invoke-static {p1}, Lcom/dropbox/core/DbxWebAuth$Request;->access$100(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    :cond_1
    invoke-static {p1}, Lcom/dropbox/core/DbxWebAuth$Request;->access$200(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 282
    invoke-static {p1}, Lcom/dropbox/core/DbxWebAuth$Request;->access$200(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, "force_reapprove"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 284
    :cond_2
    invoke-static {p1}, Lcom/dropbox/core/DbxWebAuth$Request;->access$300(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 285
    invoke-static {p1}, Lcom/dropbox/core/DbxWebAuth$Request;->access$300(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, "disable_signup"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    :cond_3
    invoke-static {p1}, Lcom/dropbox/core/DbxWebAuth$Request;->access$400(Lcom/dropbox/core/DbxWebAuth$Request;)Lcom/dropbox/core/TokenAccessType;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 288
    invoke-static {p1}, Lcom/dropbox/core/DbxWebAuth$Request;->access$400(Lcom/dropbox/core/DbxWebAuth$Request;)Lcom/dropbox/core/TokenAccessType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/TokenAccessType;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "token_access_type"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    :cond_4
    invoke-static {p1}, Lcom/dropbox/core/DbxWebAuth$Request;->access$500(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 292
    const-string v1, "scope"

    invoke-static {p1}, Lcom/dropbox/core/DbxWebAuth$Request;->access$500(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    :cond_5
    invoke-static {p1}, Lcom/dropbox/core/DbxWebAuth$Request;->access$600(Lcom/dropbox/core/DbxWebAuth$Request;)Lcom/dropbox/core/IncludeGrantedScopes;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 296
    invoke-static {p1}, Lcom/dropbox/core/DbxWebAuth$Request;->access$600(Lcom/dropbox/core/DbxWebAuth$Request;)Lcom/dropbox/core/IncludeGrantedScopes;

    move-result-object p1

    invoke-virtual {p1}, Lcom/dropbox/core/IncludeGrantedScopes;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "include_granted_scopes"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6
    if-eqz p2, :cond_7

    .line 300
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 301
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 305
    :cond_7
    iget-object p1, p0, Lcom/dropbox/core/DbxWebAuth;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    .line 306
    invoke-virtual {p1}, Lcom/dropbox/core/DbxRequestConfig;->getUserLocale()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/dropbox/core/DbxWebAuth;->appInfo:Lcom/dropbox/core/DbxAppInfo;

    .line 307
    invoke-virtual {p2}, Lcom/dropbox/core/DbxAppInfo;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object p2

    invoke-virtual {p2}, Lcom/dropbox/core/DbxHost;->getWeb()Ljava/lang/String;

    move-result-object p2

    const-string v1, "oauth2/authorize"

    .line 309
    invoke-static {v0}, Lcom/dropbox/core/DbxRequestUtil;->toParamsArray(Ljava/util/Map;)[Ljava/lang/String;

    move-result-object v0

    .line 305
    invoke-static {p1, p2, v1, v0}, Lcom/dropbox/core/DbxRequestUtil;->buildUrlWithParams(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method finish(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/DbxAuthFinish;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 425
    const-string v0, "code"

    if-eqz p1, :cond_2

    .line 426
    iget-object v1, p0, Lcom/dropbox/core/DbxWebAuth;->appInfo:Lcom/dropbox/core/DbxAppInfo;

    invoke-virtual {v1}, Lcom/dropbox/core/DbxAppInfo;->hasSecret()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 430
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 431
    const-string v2, "grant_type"

    const-string v3, "authorization_code"

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 432
    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 433
    iget-object p1, p0, Lcom/dropbox/core/DbxWebAuth;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxRequestConfig;->getUserLocale()Ljava/lang/String;

    move-result-object p1

    const-string v0, "locale"

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_0

    .line 436
    const-string p1, "redirect_uri"

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 439
    :cond_0
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 440
    iget-object p1, p0, Lcom/dropbox/core/DbxWebAuth;->appInfo:Lcom/dropbox/core/DbxAppInfo;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxAppInfo;->getKey()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/dropbox/core/DbxWebAuth;->appInfo:Lcom/dropbox/core/DbxAppInfo;

    invoke-virtual {p2}, Lcom/dropbox/core/DbxAppInfo;->getSecret()Ljava/lang/String;

    move-result-object p2

    invoke-static {v7, p1, p2}, Lcom/dropbox/core/DbxRequestUtil;->addBasicAuthHeader(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 442
    iget-object v2, p0, Lcom/dropbox/core/DbxWebAuth;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    iget-object p1, p0, Lcom/dropbox/core/DbxWebAuth;->appInfo:Lcom/dropbox/core/DbxAppInfo;

    .line 445
    invoke-virtual {p1}, Lcom/dropbox/core/DbxAppInfo;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object p1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v4

    .line 447
    invoke-static {v1}, Lcom/dropbox/core/DbxRequestUtil;->toParamsArray(Ljava/util/Map;)[Ljava/lang/String;

    move-result-object v6

    new-instance v8, Lcom/dropbox/core/DbxWebAuth$1;

    invoke-direct {v8, p0, p3}, Lcom/dropbox/core/DbxWebAuth$1;-><init>(Lcom/dropbox/core/DbxWebAuth;Ljava/lang/String;)V

    .line 442
    const-string v3, "OfficialDropboxJavaSDKv2"

    const-string v5, "oauth2/token"

    invoke-static/range {v2 .. v8}, Lcom/dropbox/core/DbxRequestUtil;->doPostNoAuth(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/DbxAuthFinish;

    return-object p1

    .line 427
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "For native apps, please use DbxPKCEWebAuth"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 425
    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public finish(Ljava/util/Map;)Lcom/dropbox/core/DbxAuthFinish;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/DbxAuthFinish;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;,
            Lcom/dropbox/core/DbxWebAuth$BadRequestException;,
            Lcom/dropbox/core/DbxWebAuth$BadStateException;,
            Lcom/dropbox/core/DbxWebAuth$CsrfException;,
            Lcom/dropbox/core/DbxWebAuth$NotApprovedException;,
            Lcom/dropbox/core/DbxWebAuth$ProviderException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 486
    iget-object v0, p0, Lcom/dropbox/core/DbxWebAuth;->deprecatedRequest:Lcom/dropbox/core/DbxWebAuth$Request;

    if-eqz v0, :cond_0

    .line 490
    invoke-static {v0}, Lcom/dropbox/core/DbxWebAuth$Request;->access$000(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/dropbox/core/DbxWebAuth;->deprecatedRequest:Lcom/dropbox/core/DbxWebAuth$Request;

    .line 491
    invoke-static {v1}, Lcom/dropbox/core/DbxWebAuth$Request;->access$700(Lcom/dropbox/core/DbxWebAuth$Request;)Lcom/dropbox/core/DbxSessionStore;

    move-result-object v1

    .line 489
    invoke-virtual {p0, v0, v1, p1}, Lcom/dropbox/core/DbxWebAuth;->finishFromRedirect(Ljava/lang/String;Lcom/dropbox/core/DbxSessionStore;Ljava/util/Map;)Lcom/dropbox/core/DbxAuthFinish;

    move-result-object p1

    return-object p1

    .line 487
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Must use DbxWebAuth.finishFromRedirect(..) instead."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public finishFromCode(Ljava/lang/String;)Lcom/dropbox/core/DbxAuthFinish;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 323
    invoke-direct {p0, p1}, Lcom/dropbox/core/DbxWebAuth;->finish(Ljava/lang/String;)Lcom/dropbox/core/DbxAuthFinish;

    move-result-object p1

    return-object p1
.end method

.method public finishFromCode(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/DbxAuthFinish;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 337
    invoke-virtual {p0, p1, p2, v0}, Lcom/dropbox/core/DbxWebAuth;->finish(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/DbxAuthFinish;

    move-result-object p1

    return-object p1
.end method

.method public finishFromRedirect(Ljava/lang/String;Lcom/dropbox/core/DbxSessionStore;Ljava/util/Map;)Lcom/dropbox/core/DbxAuthFinish;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/DbxSessionStore;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/DbxAuthFinish;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;,
            Lcom/dropbox/core/DbxWebAuth$BadRequestException;,
            Lcom/dropbox/core/DbxWebAuth$BadStateException;,
            Lcom/dropbox/core/DbxWebAuth$CsrfException;,
            Lcom/dropbox/core/DbxWebAuth$NotApprovedException;,
            Lcom/dropbox/core/DbxWebAuth$ProviderException;
        }
    .end annotation

    .line 367
    invoke-static {p1, p2, p3}, Lcom/dropbox/core/DbxWebAuth;->validateRedirectUri(Ljava/lang/String;Lcom/dropbox/core/DbxSessionStore;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p2

    .line 368
    const-string v0, "code"

    invoke-static {p3, v0}, Lcom/dropbox/core/DbxWebAuth;->getParam(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 369
    invoke-virtual {p0, p3, p1, p2}, Lcom/dropbox/core/DbxWebAuth;->finish(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/DbxAuthFinish;

    move-result-object p1

    return-object p1
.end method

.method public start(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 218
    iget-object v0, p0, Lcom/dropbox/core/DbxWebAuth;->deprecatedRequest:Lcom/dropbox/core/DbxWebAuth$Request;

    if-eqz v0, :cond_0

    .line 223
    invoke-virtual {v0}, Lcom/dropbox/core/DbxWebAuth$Request;->copy()Lcom/dropbox/core/DbxWebAuth$Request$Builder;

    move-result-object v0

    .line 224
    invoke-virtual {v0, p1}, Lcom/dropbox/core/DbxWebAuth$Request$Builder;->withState(Ljava/lang/String;)Lcom/dropbox/core/DbxWebAuth$Request$Builder;

    move-result-object p1

    .line 225
    invoke-virtual {p1}, Lcom/dropbox/core/DbxWebAuth$Request$Builder;->build()Lcom/dropbox/core/DbxWebAuth$Request;

    move-result-object p1

    .line 222
    invoke-direct {p0, p1}, Lcom/dropbox/core/DbxWebAuth;->authorizeImpl(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 219
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Must use DbxWebAuth.authorize instead."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
