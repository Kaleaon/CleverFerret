.class public final Lorg/apache/commons/vfs2/VfsLog;
.super Ljava/lang/Object;
.source "VfsLog.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static debug(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 70
    invoke-interface {p0, p2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 72
    invoke-interface {p1, p2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method public static debug(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 86
    invoke-interface {p0, p2, p3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 88
    invoke-interface {p1, p2, p3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method public static error(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 148
    invoke-interface {p0, p2}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 150
    invoke-interface {p1, p2}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method public static error(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 133
    invoke-interface {p0, p2, p3}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 135
    invoke-interface {p1, p2, p3}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method public static fatal(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 179
    invoke-interface {p0, p2}, Lorg/apache/commons/logging/Log;->fatal(Ljava/lang/Object;)V

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 181
    invoke-interface {p1, p2}, Lorg/apache/commons/logging/Log;->fatal(Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method public static fatal(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 164
    invoke-interface {p0, p2, p3}, Lorg/apache/commons/logging/Log;->fatal(Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 166
    invoke-interface {p1, p2, p3}, Lorg/apache/commons/logging/Log;->fatal(Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method public static info(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 117
    invoke-interface {p0, p2}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 119
    invoke-interface {p1, p2}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method public static info(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 102
    invoke-interface {p0, p2, p3}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 104
    invoke-interface {p1, p2, p3}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method public static warn(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 55
    invoke-interface {p0, p2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 57
    invoke-interface {p1, p2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method public static warn(Lorg/apache/commons/logging/Log;Lorg/apache/commons/logging/Log;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 40
    invoke-interface {p0, p2, p3}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 42
    invoke-interface {p1, p2, p3}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method
