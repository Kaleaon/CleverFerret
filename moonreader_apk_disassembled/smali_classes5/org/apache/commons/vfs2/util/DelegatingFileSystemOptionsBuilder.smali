.class public Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;
.super Ljava/lang/Object;
.source "DelegatingFileSystemOptionsBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;
    }
.end annotation


# static fields
.field private static final PRIMATIVE_TO_OBJECT:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation
.end field

.field private static final STRING_PARAM:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final log:Lorg/apache/commons/logging/Log;


# instance fields
.field private final beanMethods:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/reflect/Method;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private final manager:Lorg/apache/commons/vfs2/FileSystemManager;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x1

    .line 52
    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sput-object v0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->STRING_PARAM:[Ljava/lang/Class;

    .line 53
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->PRIMATIVE_TO_OBJECT:Ljava/util/Map;

    .line 54
    const-class v1, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;

    invoke-static {v1}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->log:Lorg/apache/commons/logging/Log;

    .line 60
    sget-object v1, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-class v2, Ljava/lang/Void;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-class v2, Ljava/lang/Boolean;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-class v2, Ljava/lang/Byte;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-class v2, Ljava/lang/Character;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-class v2, Ljava/lang/Short;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-class v2, Ljava/lang/Integer;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-class v2, Ljava/lang/Long;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-class v2, Ljava/lang/Double;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-class v2, Ljava/lang/Float;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/vfs2/FileSystemManager;)V
    .locals 1

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->beanMethods:Ljava/util/Map;

    .line 98
    iput-object p1, p0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->manager:Lorg/apache/commons/vfs2/FileSystemManager;

    return-void
.end method

.method private convertValuesAndInvoke(Ljava/lang/reflect/Method;Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 204
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    .line 205
    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-ge v1, v3, :cond_0

    return v2

    .line 208
    :cond_0
    aget-object v1, v0, v2

    const-class v4, Lorg/apache/commons/vfs2/FileSystemOptions;

    invoke-virtual {v1, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_1

    return v2

    :cond_1
    const/4 v1, 0x1

    .line 212
    aget-object v0, v0, v1

    .line 214
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 215
    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v4

    goto :goto_0

    .line 217
    :cond_2
    invoke-static {p2}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$500(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)[Ljava/lang/Object;

    move-result-object v4

    array-length v4, v4

    if-le v4, v1, :cond_3

    return v2

    :cond_3
    move-object v4, v0

    .line 224
    :goto_0
    invoke-virtual {v4}, Ljava/lang/Class;->isPrimitive()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 225
    sget-object v5, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->PRIMATIVE_TO_OBJECT:Ljava/util/Map;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Class;

    if-nez v5, :cond_4

    .line 227
    sget-object p1, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->log:Lorg/apache/commons/logging/Log;

    const-string p2, "vfs.provider/config-unexpected-primitive.error"

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    return v2

    :cond_4
    move-object v4, v5

    .line 233
    :cond_5
    invoke-static {p2}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$500(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)[Ljava/lang/Object;

    move-result-object v5

    aget-object v5, v5, v2

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    .line 234
    invoke-virtual {v4, v5}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 236
    invoke-static {p2}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$500(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)[Ljava/lang/Object;

    move-result-object v2

    invoke-direct {p0, v0, p2, p1, v2}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->invokeSetter(Ljava/lang/Class;Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;Ljava/lang/reflect/Method;Ljava/lang/Object;)V

    return v1

    .line 239
    :cond_6
    const-class v6, Ljava/lang/String;

    if-eq v5, v6, :cond_7

    .line 240
    sget-object p1, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 241
    invoke-static {p2}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$100(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p2}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$200(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Ljava/lang/String;

    move-result-object p2

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v0, v5, v2

    aput-object v4, v5, v1

    aput-object p2, v5, v3

    .line 240
    const-string p2, "vfs.provider/config-unexpected-value-class.error"

    invoke-static {p2, v5}, Lorg/apache/commons/vfs2/util/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    return v2

    .line 245
    :cond_7
    invoke-static {p2}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$500(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)[Ljava/lang/Object;

    move-result-object v3

    array-length v3, v3

    invoke-static {v4, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v3

    const/4 v5, 0x0

    .line 249
    :try_start_0
    sget-object v6, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->STRING_PARAM:[Ljava/lang/Class;

    invoke-virtual {v4, v6}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    nop

    move-object v6, v5

    :goto_1
    if-eqz v6, :cond_9

    const/4 v4, 0x0

    .line 255
    :goto_2
    invoke-static {p2}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$500(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)[Ljava/lang/Object;

    move-result-object v5

    array-length v5, v5

    if-ge v4, v5, :cond_8

    .line 258
    :try_start_1
    invoke-static {p2}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$500(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)[Ljava/lang/Object;

    move-result-object v5

    aget-object v5, v5, v4

    new-array v7, v1, [Ljava/lang/Object;

    aput-object v5, v7, v2

    invoke-virtual {v6, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 257
    invoke-static {v3, v4, v5}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_1

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :catch_1
    move-exception p1

    .line 264
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {p2, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    :catch_2
    move-exception p1

    .line 262
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {p2, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    :catch_3
    move-exception p1

    .line 260
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {p2, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    .line 268
    :cond_8
    invoke-direct {p0, v0, p2, p1, v3}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->invokeSetter(Ljava/lang/Class;Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;Ljava/lang/reflect/Method;Ljava/lang/Object;)V

    return v1

    .line 274
    :cond_9
    :try_start_2
    const-string v6, "valueOf"

    sget-object v7, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->STRING_PARAM:[Ljava/lang/Class;

    invoke-virtual {v4, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 275
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v6

    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v6
    :try_end_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_4

    if-nez v6, :cond_a

    goto :goto_3

    :catch_4
    nop

    :goto_3
    move-object v4, v5

    :cond_a
    if-eqz v4, :cond_c

    const/4 v6, 0x0

    .line 284
    :goto_4
    invoke-static {p2}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$500(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)[Ljava/lang/Object;

    move-result-object v7

    array-length v7, v7

    if-ge v6, v7, :cond_b

    .line 287
    :try_start_3
    invoke-static {p2}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$500(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)[Ljava/lang/Object;

    move-result-object v7

    aget-object v7, v7, v6

    new-array v8, v1, [Ljava/lang/Object;

    aput-object v7, v8, v2

    invoke-virtual {v4, v5, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 286
    invoke-static {v3, v6, v7}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_3 .. :try_end_3} :catch_6
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3 .. :try_end_3} :catch_5

    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    :catch_5
    move-exception p1

    .line 291
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {p2, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    :catch_6
    move-exception p1

    .line 289
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {p2, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    .line 295
    :cond_b
    invoke-direct {p0, v0, p2, p1, v3}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->invokeSetter(Ljava/lang/Class;Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;Ljava/lang/reflect/Method;Ljava/lang/Object;)V

    return v1

    :cond_c
    return v2
.end method

.method private createSchemeMethods(Ljava/lang/String;)Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/reflect/Method;",
            ">;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 353
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->getManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/apache/commons/vfs2/FileSystemManager;->getFileSystemConfigBuilder(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileSystemConfigBuilder;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 358
    new-instance p1, Ljava/util/TreeMap;

    invoke-direct {p1}, Ljava/util/TreeMap;-><init>()V

    .line 360
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    .line 361
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_3

    aget-object v3, v0, v2

    .line 362
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_1

    .line 366
    :cond_0
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    .line 367
    const-string v5, "set"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    goto :goto_1

    :cond_1
    const/4 v5, 0x3

    .line 372
    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    .line 374
    invoke-interface {p1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    if-nez v5, :cond_2

    .line 376
    new-instance v5, Ljava/util/ArrayList;

    const/4 v6, 0x2

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 377
    invoke-interface {p1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    :cond_2
    invoke-interface {v5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return-object p1

    .line 355
    :cond_4
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v1, "vfs.provider/no-config-builder.error"

    invoke-direct {v0, v1, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method private fillConfigSetters(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 326
    invoke-static {p1}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$100(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->getSchemeMethods(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    .line 327
    invoke-static {p1}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$200(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 332
    :cond_0
    invoke-static {p1, v0}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$402(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;Ljava/util/List;)Ljava/util/List;

    const/4 p1, 0x1

    return p1
.end method

.method private getSchemeMethods(Ljava/lang/String;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/reflect/Method;",
            ">;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 340
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->beanMethods:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_0

    .line 342
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->createSchemeMethods(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    .line 343
    iget-object v1, p0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->beanMethods:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method private invokeSetter(Ljava/lang/Class;Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;Ljava/lang/reflect/Method;Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 308
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result p1

    const/4 v0, 0x1

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eqz p1, :cond_0

    .line 309
    new-array p1, v1, [Ljava/lang/Object;

    invoke-static {p2}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$600(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v1

    aput-object v1, p1, v2

    aput-object p4, p1, v0

    goto :goto_0

    .line 311
    :cond_0
    new-array p1, v1, [Ljava/lang/Object;

    invoke-static {p2}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$600(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Lorg/apache/commons/vfs2/FileSystemOptions;

    move-result-object v1

    aput-object v1, p1, v2

    invoke-static {p4, v2}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object p4

    aput-object p4, p1, v0

    .line 314
    :goto_0
    :try_start_0
    invoke-static {p2}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$300(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Lorg/apache/commons/vfs2/FileSystemConfigBuilder;

    move-result-object p2

    invoke-virtual {p3, p2, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 318
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {p2, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    :catch_1
    move-exception p1

    .line 316
    new-instance p2, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {p2, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method private setValues(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 181
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->fillConfigSetters(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-eqz v0, :cond_2

    .line 186
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->getManager()Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v0

    invoke-static {p1}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$100(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Lorg/apache/commons/vfs2/FileSystemManager;->getFileSystemConfigBuilder(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileSystemConfigBuilder;

    move-result-object v0

    invoke-static {p1, v0}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$302(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;Lorg/apache/commons/vfs2/FileSystemConfigBuilder;)Lorg/apache/commons/vfs2/FileSystemConfigBuilder;

    .line 189
    invoke-static {p1}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$400(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 190
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 191
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/reflect/Method;

    .line 192
    invoke-direct {p0, v4, p1}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->convertValuesAndInvoke(Ljava/lang/reflect/Method;Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-void

    .line 197
    :cond_1
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-static {p1}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$100(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p1}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$200(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Ljava/lang/String;

    move-result-object v5

    invoke-static {p1}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$500(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)[Ljava/lang/Object;

    move-result-object p1

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v4, v6, v2

    aput-object v5, v6, v1

    aput-object p1, v6, v3

    const-string p1, "vfs.provider/config-value-invalid.error"

    invoke-direct {v0, p1, v6}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v0

    .line 182
    :cond_2
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-static {p1}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$100(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p1}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;->access$200(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)Ljava/lang/String;

    move-result-object p1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v4, v3, v2

    aput-object p1, v3, v1

    const-string p1, "vfs.provider/config-key-invalid.error"

    invoke-direct {v0, p1, v3}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v0
.end method


# virtual methods
.method protected getManager()Lorg/apache/commons/vfs2/FileSystemManager;
    .locals 1

    .line 102
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->manager:Lorg/apache/commons/vfs2/FileSystemManager;

    return-object v0
.end method

.method public setConfigClass(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/vfs2/FileSystemOptions;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 149
    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    aput-object p4, v0, v1

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->setConfigClasses(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)V

    return-void
.end method

.method public setConfigClasses(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/vfs2/FileSystemOptions;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .line 166
    array-length v0, p4

    new-array v5, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 168
    aget-object v2, p4, v1

    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v5, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 171
    :cond_0
    new-instance v1, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;

    const/4 v6, 0x0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v1 .. v6}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;-><init>(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$1;)V

    .line 173
    invoke-direct {p0, v1}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->setValues(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)V

    return-void
.end method

.method public setConfigString(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 116
    filled-new-array {p4}, [Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->setConfigStrings(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method public setConfigStrings(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 130
    new-instance v0, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;

    const/4 v5, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;-><init>(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$1;)V

    .line 132
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder;->setValues(Lorg/apache/commons/vfs2/util/DelegatingFileSystemOptionsBuilder$Context;)V

    return-void
.end method
