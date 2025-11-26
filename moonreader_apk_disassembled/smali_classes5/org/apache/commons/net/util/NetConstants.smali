.class public Lorg/apache/commons/net/util/NetConstants;
.super Ljava/lang/Object;
.source "NetConstants.java"


# static fields
.field public static final EMPTY_BTYE_ARRAY:[B

.field public static final EMPTY_STRING_ARRAY:[Ljava/lang/String;

.field public static final EMPTY_X509_CERTIFICATE_ARRAY:[Ljava/security/cert/X509Certificate;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x0

    .line 31
    new-array v1, v0, [Ljava/lang/String;

    sput-object v1, Lorg/apache/commons/net/util/NetConstants;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    .line 36
    new-array v1, v0, [B

    sput-object v1, Lorg/apache/commons/net/util/NetConstants;->EMPTY_BTYE_ARRAY:[B

    .line 41
    new-array v0, v0, [Ljava/security/cert/X509Certificate;

    sput-object v0, Lorg/apache/commons/net/util/NetConstants;->EMPTY_X509_CERTIFICATE_ARRAY:[Ljava/security/cert/X509Certificate;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
