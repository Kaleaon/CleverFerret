.class final Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;
.super Ljava/lang/Object;
.source "DelegatingFileSystemOptionsBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Context"
.end annotation


# instance fields
.field private configSetters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation
.end field

.field private fileSystemConfigBuilder:Lorg/apache/commons/vfs2/FileSystemConfigBuilder;

.field private final fso:Lorg/apache/commons/vfs2/FileSystemOptions;

.field private final name:Ljava/lang/String;

.field private final scheme:Ljava/lang/String;

.field private final values:[Ljava/lang/Object;


# direct methods
.method private constructor <init>(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-object p1, p0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->fso:Lorg/apache/commons/vfs2/FileSystemOptions;

    .line 85
    iput-object p2, p0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->scheme:Ljava/lang/String;

    .line 86
    iput-object p3, p0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->name:Ljava/lang/String;

    .line 87
    iput-object p4, p0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->values:[Ljava/lang/Object;

    return-void
.end method

.method synthetic constructor <init>(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$1;)V
    .locals 0

    .line 74
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;-><init>(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$100(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Ljava/lang/String;
    .locals 0

    .line 74
    iget-object p0, p0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->scheme:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Ljava/lang/String;
    .locals 0

    .line 74
    iget-object p0, p0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->name:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
    .locals 0

    .line 74
    iget-object p0, p0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->fileSystemConfigBuilder:Lorg/apache/commons/vfs2/FileSystemConfigBuilder;

    return-object p0
.end method

.method static synthetic access$302(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;Lorg/apache/commons/vfs2/FileSystemConfigBuilder;)Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
    .locals 0

    .line 74
    iput-object p1, p0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->fileSystemConfigBuilder:Lorg/apache/commons/vfs2/FileSystemConfigBuilder;

    return-object p1
.end method

.method static synthetic access$400(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Ljava/util/List;
    .locals 0

    .line 74
    iget-object p0, p0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->configSetters:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$402(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;Ljava/util/List;)Ljava/util/List;
    .locals 0

    .line 74
    iput-object p1, p0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->configSetters:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$500(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)[Ljava/lang/Object;
    .locals 0

    .line 74
    iget-object p0, p0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->values:[Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$600(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Lorg/apache/commons/vfs2/FileSystemOptions;
    .locals 0

    .line 74
    iget-object p0, p0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->fso:Lorg/apache/commons/vfs2/FileSystemOptions;

    return-object p0
.end method
